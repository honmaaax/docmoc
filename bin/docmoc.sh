#!/usr/bin/env node
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 10);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

module.exports = require("lodash");

/***/ }),
/* 1 */
/***/ (function(module, exports) {

module.exports = require("commander");

/***/ }),
/* 2 */
/***/ (function(module, exports) {

module.exports = require("bluebird");

/***/ }),
/* 3 */
/***/ (function(module, exports) {

module.exports = require("swagger-ui-express");

/***/ }),
/* 4 */
/***/ (function(module, exports) {

module.exports = require("fs");

/***/ }),
/* 5 */
/***/ (function(module, exports) {

module.exports = require("moment");

/***/ }),
/* 6 */
/***/ (function(module, exports) {

module.exports = require("js-yaml");

/***/ }),
/* 7 */
/***/ (function(module, exports) {

module.exports = require("chance");

/***/ }),
/* 8 */
/***/ (function(module, exports) {

module.exports = require("express");

/***/ }),
/* 9 */
/***/ (function(module, exports) {

module.exports = require("swagger-express-middleware");

/***/ }),
/* 10 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);

// EXTERNAL MODULE: external "commander"
var external_commander_ = __webpack_require__(1);
var external_commander_default = /*#__PURE__*/__webpack_require__.n(external_commander_);

// EXTERNAL MODULE: external "fs"
var external_fs_ = __webpack_require__(4);
var external_fs_default = /*#__PURE__*/__webpack_require__.n(external_fs_);

// EXTERNAL MODULE: external "bluebird"
var external_bluebird_ = __webpack_require__(2);
var external_bluebird_default = /*#__PURE__*/__webpack_require__.n(external_bluebird_);

// EXTERNAL MODULE: external "lodash"
var external_lodash_ = __webpack_require__(0);
var external_lodash_default = /*#__PURE__*/__webpack_require__.n(external_lodash_);

// EXTERNAL MODULE: external "js-yaml"
var external_js_yaml_ = __webpack_require__(6);
var external_js_yaml_default = /*#__PURE__*/__webpack_require__.n(external_js_yaml_);

// EXTERNAL MODULE: external "express"
var external_express_ = __webpack_require__(8);
var external_express_default = /*#__PURE__*/__webpack_require__.n(external_express_);

// EXTERNAL MODULE: external "swagger-ui-express"
var external_swagger_ui_express_ = __webpack_require__(3);
var external_swagger_ui_express_default = /*#__PURE__*/__webpack_require__.n(external_swagger_ui_express_);

// EXTERNAL MODULE: external "swagger-express-middleware"
var external_swagger_express_middleware_ = __webpack_require__(9);
var external_swagger_express_middleware_default = /*#__PURE__*/__webpack_require__.n(external_swagger_express_middleware_);

// EXTERNAL MODULE: external "moment"
var external_moment_ = __webpack_require__(5);
var external_moment_default = /*#__PURE__*/__webpack_require__.n(external_moment_);

// EXTERNAL MODULE: external "chance"
var external_chance_ = __webpack_require__(7);
var external_chance_default = /*#__PURE__*/__webpack_require__.n(external_chance_);

// CONCATENATED MODULE: ./src/generateMockBody.js




const chance = new external_chance_default.a()

function generateMockBody(definitions, schema, brothers) {
  if ( external_lodash_default.a.has(schema, '$ref') ) {
    const definition = definitions[schema.$ref]
    return generateMockBody(definitions, definition)
  } else if ( external_lodash_default.a.get(schema, 'type') === 'object' ) {
    if (
      external_lodash_default.a.has(schema.properties, 'allOf') ||
      external_lodash_default.a.has(schema.properties, 'anyOf') ||
      external_lodash_default.a.has(schema.properties, 'oneOf')
    ) {
      return generateMockBody(definitions, schema.properties)
    } else {
      return external_lodash_default.a.reduce(schema.properties, (obj, prop, name)=>{
        return Object.assign({[name]: generateMockBody(definitions, prop, schema.properties)}, obj)
      }, {})
    }
  } else if ( external_lodash_default.a.get(schema, 'type') === 'array' ) {
    const size = schema['x-mock-array-size'] || 1
    return external_lodash_default.a.range(0, size).map(()=>{
      return generateMockBody(definitions, schema.items)
    })
  } else if ( external_lodash_default.a.has(schema, 'x-mock') ) {
    const mockData = external_lodash_default.a.get(schema, 'x-mock')
    return external_lodash_default.a.isArray(mockData) ? external_lodash_default.a.sample(mockData) : mockData
  } else if ( external_lodash_default.a.get(schema, 'type') === 'string' ) {
    if ( external_lodash_default.a.has(schema, 'enum') ) return external_lodash_default.a.sample(schema.enum)
    switch (schema.format) {
      case 'date':
        return external_moment_default()(chance.date()).format('YYYY-MM-DD')
      case 'date-time':
        return `${external_moment_default()(chance.date()).format('YYYY-MM-DDThh:mm:ss')}Z`
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
  } else if ( external_lodash_default.a.get(schema, 'type') === 'number' ) {
    return chance.floating({ min: schema.minimum, max: schema.maximum })
  } else if ( external_lodash_default.a.get(schema, 'type') === 'integer' ) {
    const size = external_lodash_default.a.result(external_lodash_default.a.get(brothers, external_lodash_default.a.get(schema, 'x-mock-array-key')), 'x-mock-array-size')
    if ( size ) {
      return size
    } else {
      return chance.integer({ min: schema.minimum, max: schema.maximum })
    }
  } else if ( external_lodash_default.a.get(schema, 'type') === 'boolean' ) {
    return chance.bool()
  } else if ( external_lodash_default.a.has(schema, 'allOf') ) {
    switch (schema.allOf[0].type) {
      case 'object':
        return external_lodash_default.a.reduce(schema.allOf, (obj, values)=>{
          return external_lodash_default.a.merge(obj, generateMockBody(definitions, values))
        }, {})
      default:
        return generateMockBody(definitions, external_lodash_default.a.last(schema.allOf))
    }
  } else if ( external_lodash_default.a.has(schema, 'anyOf') ) {
    return generateMockBody(definitions, external_lodash_default.a.sample(schema.anyOf))
  } else if ( external_lodash_default.a.has(schema, 'oneOf') ) {
    return generateMockBody(definitions, external_lodash_default.a.sample(schema.oneOf))
  }
  return schema
}

// CONCATENATED MODULE: ./src/index.js











const app = external_express_default()()
external_commander_default.a
  .usage('[options] [swagger_file_path]')
  .arguments('[options] [swagger_file_path]')
  .option('-p, --port <port>', 'Change port')
  .parse(process.argv)
const filePath = (external_commander_default.a.args && external_commander_default.a.args[0]) || './swagger.yml'
const port = external_commander_default.a.port || 3000
external_bluebird_default.a.promisify(external_fs_default.a.readFile)(filePath, 'utf-8')
  .then(external_js_yaml_default.a.safeLoad)
  .then((swaggerDocument)=>{
    if ( !external_lodash_default.a.isObject(swaggerDocument) ) throw new Error('Invalid File')
    app.use('/docs', external_swagger_ui_express_default.a.serve, external_swagger_ui_express_default.a.setup(swaggerDocument))
  })
  .then(()=>external_bluebird_default.a.promisify(external_swagger_express_middleware_default.a)(filePath, app))
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


/***/ })
/******/ ]);