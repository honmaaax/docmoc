import program from 'commander'
import fs from 'fs'
import Promise from 'bluebird'
import _ from 'lodash'
import yaml from 'js-yaml'
import express from 'express'
import swaggerUi from 'swagger-ui-express'
import swaggerExpressMiddleware from 'swagger-express-middleware'

import generateMockBody from './generateMockBody'

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
