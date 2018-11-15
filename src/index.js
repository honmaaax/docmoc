import program from 'commander'
import fs from 'fs'
import Promise from 'bluebird'
import _ from 'lodash'
import moment from 'moment'
import yaml from 'js-yaml'
import Chance from 'chance'
import express from 'express'
import swaggerUi from 'swagger-ui-express'
import swaggerExpressMiddleware from 'swagger-express-middleware'

const chance = new Chance()
const app = express()
program
  .usage('[options] [swagger_file_path]')
  .arguments('[options] [swagger_file_path]')
  .option('-p, --port <port>', 'Change port')
  .parse(process.argv)
const filePath = (program.args && program.args[0]) || './swagger.yml'
const port = program.port || 3000
Promise.promisify(fs.readFile)(filePath, 'utf-8')
  .then(yaml.safeLoad)
  .then((swaggerDocument)=>{
    if ( !_.isObject(swaggerDocument) ) throw new Error('Invalid File')
    app.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument))
  })
  .then(()=>Promise.promisify(swaggerExpressMiddleware)(filePath, app))
  .then((middleware)=>{
    app.use(
      middleware.metadata(),
      middleware.CORS(),
      middleware.files(),
      middleware.parseRequest(),
      middleware.validateRequest(),
    )
    app.use((req, res, next)=>{
      const definitions = req.swagger.api.definitions
      const schema = req.swagger.operation.responses[200].schema
      res.body = generateMockBody(definitions, schema)
      next()
    })
    app.use(middleware.mock()[0])
    app.use(middleware.mock()[1])
    app.use(middleware.mock()[2])
    app.use((req, res, next)=>{
      if (res.swagger) {
        if (res.swagger.isEmpty) {
          res.send()
        }
        else {
          switch (res.swagger.schema.type) {
            case 'object':
            case 'array':
            case undefined:
              res.json(res.body)
              break
            default:
              res.send(res.body)
          }
        }
      }
      else {
        next()
      }
    })
    app.get('/', (req, res) => {
      res.send('Hello!')
    })
    app.listen(port, () => console.log(`App listening on port ${port}!`))
  })

function generateMockBody(definitions, schema, brothers) {
  if ( _.has(schema, '$ref') ) {
    const definition = definitions[schema.$ref]
    return generateMockBody(definitions, definition)
  } else if ( _.get(schema, 'type') === 'object' ) {
    return _.reduce(schema.properties, (obj, prop, name)=>{
      return Object.assign({[name]: generateMockBody(definitions, prop, schema.properties)}, obj)
    }, {})
  } else if ( _.get(schema, 'type') === 'array' ) {
    const size = schema['x-mock-array-size'] || 1
    return _.range(0, size).map(()=>{
      return generateMockBody(definitions, schema.items)
    })
  } else if ( _.get(schema, 'type') === 'string' ) {
    switch (schema.format) {
      case 'date':
        return moment(chance.date()).format('YYYY-MM-DD')
      case 'date-time':
        return `${moment(chance.date()).format('YYYY-MM-DDThh:mm:ss')}Z`
      case 'byte':
      case 'binary':
        return (new Buffer(chance.string(), 'binary')).toString('base64')
      case 'email':
        return chance.email()
      case 'uuid':
        return chance.guid({version: 1})
      case 'hostname':
        return chance.domain()
      case 'ipv4':
        return chance.ip()
      case 'ipv6':
        return chance.ipv6()
      default:
        return chance.string({pool: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'})
    }
  } else if ( _.get(schema, 'type') === 'number' ) {
    return chance.floating({ min: schema.minimum, max: schema.maximum })
  } else if ( _.get(schema, 'type') === 'integer' ) {
    const size = _.result(_.get(brothers, _.get(schema, 'x-mock-array-key')), 'x-mock-array-size')
    if ( size ) {
      return size
    } else {
      return chance.integer({ min: schema.minimum, max: schema.maximum })
    }
  } else if ( _.get(schema, 'type') === 'boolean' ) {
    return chance.bool()
  }
  // [TODO] allOf, oneOf, anyOf
  return schema
}
