import program from 'commander'
import fs from 'fs'
import Promise from 'bluebird'
import _ from 'lodash'
import yaml from 'js-yaml'
import express from 'express'
import swaggerUi from 'swagger-ui-express'

program
  .usage('<swagger_file_path>')
  .arguments('<swagger_file_path>')
  .parse(process.argv)
const filePath = (program.args && program.args[0]) || './swagger.yml'
Promise.promisify(fs.readFile)(filePath, 'utf-8')
  .then(yaml.safeLoad)
  .then((swaggerDocument)=>{
    if ( !_.isObject(swaggerDocument) ) throw new Error('Invalid File')
    const app = express()
    app.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument))
    app.get('/', (req, res) => {
      res.send('Hello!')
    })
    app.listen(3000, () => console.log('App listening on port 3000!'))
  })
