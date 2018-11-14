import program from 'commander'
import fs from 'fs'
import Promise from 'bluebird'
import _ from 'lodash'
import yaml from 'js-yaml'
import Chance from 'chance'
import express from 'express'
import swaggerUi from 'swagger-ui-express'
import swaggerExpressMiddleware from 'swagger-express-middleware'

const chance = new Chance()
const app = express()
program
  .usage('<swagger_file_path>')
  .arguments('<swagger_file_path>')
  .parse(process.argv)
const filePath = (program.args && program.args[0]) || './swagger.yml'

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
      console.log(definitions)
      console.log(schema)
      res.body = generateMockBody(definitions, schema)
      next()
    })
    app.use(middleware.mock())
    app.get('/', (req, res) => {
      res.send('Hello!')
    })
    app.listen(3000, () => console.log('App listening on port 3000!'))
  })

function generateMockBody(definitions, schema) {
  if ( _.has(schema, '$ref') ) {
    const definition = definitions[schema.$ref]
    return generateMockBody(definitions, definition)
  } else if ( _.get(schema, 'type') === 'object' ) {
    return _.reduce(schema.properties, (obj, prop, name)=>{
      return Object.assign({[name]: generateMockBody(definitions, prop)}, obj)
    }, {})
  } else if ( _.get(schema, 'type') === 'array' ) {
    const size = 3
    return _.range(0, size).map(()=>{
      return generateMockBody(definitions, schema.items)
    })
  } else if ( _.get(schema, 'type') === 'string' ) {
    return chance.string({pool: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'})
  } else if ( _.get(schema, 'type') === 'number' ) {
    return chance.floating({ min: schema.minimum, max: schema.maximum })
  } else if ( _.get(schema, 'type') === 'integer' ) {
    return chance.integer({ min: schema.minimum, max: schema.maximum })
  } else if ( _.get(schema, 'type') === 'boolean' ) {
    return chance.bool()
  }
  // [TODO] allOf, oneOf, anyOf
  return schema
}
