import _ from 'lodash'
import generateMockBody from '../src/generateMockBody'

describe('generateMockBody()', ()=>{
  describe('types and formats', ()=>{
    it('should generate a mock data', ()=>{
      const schema = {type: 'integer'}
      const res = generateMockBody({}, schema)
      expect(_.isInteger(res)).toBeTruthy()
    })
    it('should generate a random data', ()=>{
      const schema = {type: 'integer'}
      const res1 = generateMockBody({}, schema)
      const res2 = generateMockBody({}, schema)
      expect(res1).not.toEqual(res2)
    })
    it('should generate an undefined type data', ()=>{
      const schema = {type: 'dummy'}
      const res = generateMockBody({}, schema)
      expect(res).toEqual(schema)
    })
    it('should generate a number', ()=>{
      const schema = {type: 'number'}
      const res = generateMockBody({}, schema)
      expect(_.isNumber(res)).toBeTruthy()
    })
    it('should generate a boolean', ()=>{
      const schema = {type: 'boolean'}
      const res = generateMockBody({}, schema)
      expect(_.isBoolean(res)).toBeTruthy()
    })
    it('should generate a string', ()=>{
      const schema = {type: 'string'}
      const res = generateMockBody({}, schema)
      expect(_.isString(res)).toBeTruthy()
      expect(res).toMatch(/^[a-z0-9]+$/i)
    })
    it('should generate a string as date', ()=>{
      const schema = {type: 'string', format: 'date'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}$/)
    })
    it('should generate a string as datetime', ()=>{
      const schema = {type: 'string', format: 'date-time'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}T[0-9]{2}\:[0-9]{2}\:[0-9]{2}Z$/)
    })
    it('should generate a base64 encoded string, if set byte format', ()=>{
      const schema = {type: 'string', format: 'byte'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[a-z0-9]+?\=*$/i)
    })
    it('should generate a base64 encoded string, if set binary format', ()=>{
      const schema = {type: 'string', format: 'binary'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[a-z0-9]+?\=*$/i)
    })
    it('should generate a string as email', ()=>{
      const schema = {type: 'string', format: 'email'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)
    })
    it('should generate a string as uuid', ()=>{
      const schema = {type: 'string', format: 'uuid'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[a-z0-9]{8}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{12}$/)
    })
    it('should generate a string as hostname', ()=>{
      const schema = {type: 'string', format: 'hostname'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[a-z][a-z0-9]+?\.[a-z]{2,4}$/)
    })
    it('should generate a string as ipv4', ()=>{
      const schema = {type: 'string', format: 'ipv4'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}$/)
    })
    it('should generate a string as ipv6', ()=>{
      const schema = {type: 'string', format: 'ipv6'}
      const res = generateMockBody({}, schema)
      expect(res).toMatch(/^[a-z0-9]{4}(\:[a-z0-9]{4}){7}$/)
    })
    it('should generate an object', ()=>{
      const schema = {
        type: 'object',
        properties: {
          foo: {type: 'integer'},
          bar: {type: 'string'},
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.isInteger(res.foo)).toBeTruthy()
      expect(_.isString(res.bar)).toBeTruthy()
    })
    it('should generate an array', ()=>{
      const schema = {
        type: 'array',
        items: {type: 'integer'},
      }
      const res = generateMockBody({}, schema)
      expect(_.isInteger(res[0])).toBeTruthy()
    })
  })
  describe('$ref', ()=>{
    it('should reference a definition', ()=>{
      const definition = {foo: {type: 'integer'}}
      const schema = {$ref: 'foo'}
      const res = generateMockBody(definition, schema)
      expect(_.isInteger(res)).toBeTruthy()
    })
  })
  describe('allOf', ()=>{
    it('should generate a random string if used the allOf to strings', ()=>{
      const schema = {
        type: 'object',
        properties: {
          allOf: [
            {type: 'string'},
            {type: 'string'},
          ],
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.isString(res)).toBeTruthy()
    })
    it('should generate a random sampled string if used the allOf to enums', ()=>{
      const schema = {
        type: 'object',
        properties: {
          allOf: [
            {type: 'string', enum: ['foo', 'bar', 'baz']},
            {type: 'string', enum: ['oof', 'rab', 'zab']},
          ],
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.includes(['foo', 'bar', 'baz', 'oof', 'rab', 'zab'], res)).toBeTruthy()
    })
    it('should generate a merged object if used the allOf to objects', ()=>{
      const schema = {
        type: 'object',
        properties: {
          allOf: [
            {type: 'object', properties: {foo: {type: 'string'}}},
            {type: 'object', properties: {bar: {type: 'string'}}},
          ],
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.isString(res.foo)).toBeTruthy()
      expect(_.isString(res.bar)).toBeTruthy()
    })
  })
  describe('anyOf', ()=>{
    it('should generate a random sampled string if used the anyOf to strings', ()=>{
      const schema = {
        type: 'object',
        properties: {
          anyOf: [
            {type: 'string'},
            {type: 'integer'},
          ],
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.isString(res) || _.isInteger(res)).toBeTruthy()
    })
    it('should generate a random sampled object if used the anyOf to objects', ()=>{
      const schema = {
        type: 'object',
        properties: {
          anyOf: [
            {type: 'object', properties: {foo: {type: 'string'}}},
            {type: 'object', properties: {bar: {type: 'string'}}},
          ],
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.has(res, 'foo') || _.has(res, 'bar')).toBeTruthy()
    })
  })
  describe('oneOf', ()=>{
    it('should generate a random sampled string if used the oneOf to strings', ()=>{
      const schema = {
        type: 'object',
        properties: {
          oneOf: [
            {type: 'string'},
            {type: 'integer'},
          ],
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.isString(res) || _.isInteger(res)).toBeTruthy()
    })
    it('should generate a random sampled object if used the oneOf to objects', ()=>{
      const schema = {
        type: 'object',
        properties: {
          oneOf: [
            {type: 'object', properties: {foo: {type: 'string'}}},
            {type: 'object', properties: {bar: {type: 'string'}}},
          ],
        },
      }
      const res = generateMockBody({}, schema)
      expect(_.has(res, 'foo') || _.has(res, 'bar')).toBeTruthy()
    })
  })
  describe('x-mock', ()=>{
    it('should return the string if set x-mock', ()=>{
      const schema = {
        type: 'string',
        'x-mock': 'foo',
      }
      const res = generateMockBody({}, schema)
      expect(res).toBe('foo')
    })
    it('should return the integer if set x-mock', ()=>{
      const schema = {
        type: 'integer',
        'x-mock': 1234,
      }
      const res = generateMockBody({}, schema)
      expect(res).toBe(1234)
    })
    it('should return the number if set x-mock', ()=>{
      const schema = {
        type: 'number',
        'x-mock': 1234.567,
      }
      const res = generateMockBody({}, schema)
      expect(res).toBe(1234.567)
    })
    it('should return the boolean if set x-mock', ()=>{
      const schema = {
        type: 'boolean',
        'x-mock': false,
      }
      const res = generateMockBody({}, schema)
      expect(res).toBe(false)
    })
    it('should return a random sampled string if set x-mock', ()=>{
      const schema = {
        type: 'string',
        'x-mock': ['foo', 'bar', 'baz'],
      }
      const res = generateMockBody({}, schema)
      expect(_.includes(['foo', 'bar', 'baz'], res)).toBeTruthy()
    })
  })
  describe('x-mock-array', ()=>{
    it('should return same length arrays if set x-mock-array-size', ()=>{
      const schema = {
        type: 'array',
        items: {type: 'string'},
        'x-mock-array-size': 5,
      }
      const res = generateMockBody({}, schema)
      expect(res.length).toBe(5)
    })
    it('should return a same integer if set x-mock-array-key', ()=>{
      const schema = {
        type: 'object',
        properties: {
          data: {
            type: 'array',
            items: {type: 'string'},
            'x-mock-array-size': 5,
          },
          total: {
            type: 'integer',
            'x-mock-array-key': 'data',
          }
        },
      }
      const res = generateMockBody({}, schema)
      expect(res.total).toBe(5)
    })
  })
})
