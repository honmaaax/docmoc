import _ from 'lodash'
import moment from 'moment'
import Chance from 'chance'

const chance = new Chance()

export default function generateMockBody(definitions, schema, brothers) {
  if ( _.has(schema, '$ref') ) {
    const definition = definitions[schema.$ref]
    return generateMockBody(definitions, definition)
  } else if ( _.get(schema, 'type') === 'object' ) {
    if (
      _.has(schema.properties, 'allOf') ||
      _.has(schema.properties, 'anyOf') ||
      _.has(schema.properties, 'oneOf')
    ) {
      return generateMockBody(definitions, schema.properties)
    } else {
      return _.reduce(schema.properties, (obj, prop, name)=>{
        return Object.assign({[name]: generateMockBody(definitions, prop, schema.properties)}, obj)
      }, {})
    }
  } else if ( _.get(schema, 'type') === 'array' ) {
    const size = schema['x-mock-array-size'] || 1
    return _.range(0, size).map(()=>{
      return generateMockBody(definitions, schema.items)
    })
  } else if ( _.has(schema, 'x-mock') ) {
    const mockData = _.get(schema, 'x-mock')
    return _.isArray(mockData) ? _.sample(mockData) : mockData
  } else if ( _.get(schema, 'type') === 'string' ) {
    if ( _.has(schema, 'enum') ) return _.sample(schema.enum)
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
  } else if ( _.has(schema, 'allOf') ) {
    switch (schema.allOf[0].type) {
      case 'object':
        return _.reduce(schema.allOf, (obj, values)=>{
          return _.merge(obj, generateMockBody(definitions, values))
        }, {})
      default:
        return generateMockBody(definitions, _.last(schema.allOf))
    }
  } else if ( _.has(schema, 'anyOf') ) {
    return generateMockBody(definitions, _.sample(schema.anyOf))
  } else if ( _.has(schema, 'oneOf') ) {
    return generateMockBody(definitions, _.sample(schema.oneOf))
  }
  return schema
}
