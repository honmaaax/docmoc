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
/* harmony import */ var commander__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(1);
/* harmony import */ var commander__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(commander__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var fs__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(4);
/* harmony import */ var fs__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(fs__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var bluebird__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(2);
/* harmony import */ var bluebird__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(bluebird__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var lodash__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(0);
/* harmony import */ var lodash__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(lodash__WEBPACK_IMPORTED_MODULE_3__);
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(5);
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(moment__WEBPACK_IMPORTED_MODULE_4__);
/* harmony import */ var js_yaml__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(6);
/* harmony import */ var js_yaml__WEBPACK_IMPORTED_MODULE_5___default = /*#__PURE__*/__webpack_require__.n(js_yaml__WEBPACK_IMPORTED_MODULE_5__);
/* harmony import */ var chance__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(7);
/* harmony import */ var chance__WEBPACK_IMPORTED_MODULE_6___default = /*#__PURE__*/__webpack_require__.n(chance__WEBPACK_IMPORTED_MODULE_6__);
/* harmony import */ var express__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(8);
/* harmony import */ var express__WEBPACK_IMPORTED_MODULE_7___default = /*#__PURE__*/__webpack_require__.n(express__WEBPACK_IMPORTED_MODULE_7__);
/* harmony import */ var swagger_ui_express__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(3);
/* harmony import */ var swagger_ui_express__WEBPACK_IMPORTED_MODULE_8___default = /*#__PURE__*/__webpack_require__.n(swagger_ui_express__WEBPACK_IMPORTED_MODULE_8__);
/* harmony import */ var swagger_express_middleware__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(9);
/* harmony import */ var swagger_express_middleware__WEBPACK_IMPORTED_MODULE_9___default = /*#__PURE__*/__webpack_require__.n(swagger_express_middleware__WEBPACK_IMPORTED_MODULE_9__);











const chance = new chance__WEBPACK_IMPORTED_MODULE_6___default.a()
const app = express__WEBPACK_IMPORTED_MODULE_7___default()()
commander__WEBPACK_IMPORTED_MODULE_0___default.a
  .usage('[options] [swagger_file_path]')
  .arguments('[options] [swagger_file_path]')
  .option('-p, --port <port>', 'Change port')
  .parse(process.argv)
const filePath = (commander__WEBPACK_IMPORTED_MODULE_0___default.a.args && commander__WEBPACK_IMPORTED_MODULE_0___default.a.args[0]) || './swagger.yml'
const port = commander__WEBPACK_IMPORTED_MODULE_0___default.a.port || 3000
bluebird__WEBPACK_IMPORTED_MODULE_2___default.a.promisify(fs__WEBPACK_IMPORTED_MODULE_1___default.a.readFile)(filePath, 'utf-8')
  .then(js_yaml__WEBPACK_IMPORTED_MODULE_5___default.a.safeLoad)
  .then((swaggerDocument)=>{
    if ( !lodash__WEBPACK_IMPORTED_MODULE_3___default.a.isObject(swaggerDocument) ) throw new Error('Invalid File')
    app.use('/docs', swagger_ui_express__WEBPACK_IMPORTED_MODULE_8___default.a.serve, swagger_ui_express__WEBPACK_IMPORTED_MODULE_8___default.a.setup(swaggerDocument))
  })
  .then(()=>bluebird__WEBPACK_IMPORTED_MODULE_2___default.a.promisify(swagger_express_middleware__WEBPACK_IMPORTED_MODULE_9___default.a)(filePath, app))
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
  if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.has(schema, '$ref') ) {
    const definition = definitions[schema.$ref]
    return generateMockBody(definitions, definition)
  } else if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'type') === 'object' ) {
    return lodash__WEBPACK_IMPORTED_MODULE_3___default.a.reduce(schema.properties, (obj, prop, name)=>{
      return Object.assign({[name]: generateMockBody(definitions, prop, schema.properties)}, obj)
    }, {})
  } else if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'type') === 'array' ) {
    const size = schema['x-mock-array-size'] || 1
    return lodash__WEBPACK_IMPORTED_MODULE_3___default.a.range(0, size).map(()=>{
      return generateMockBody(definitions, schema.items)
    })
  } else if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.has(schema, 'x-mock') ) {
    const mockData = lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'x-mock')
    return lodash__WEBPACK_IMPORTED_MODULE_3___default.a.isArray(mockData) ? lodash__WEBPACK_IMPORTED_MODULE_3___default.a.sample(mockData) : mockData
  } else if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'type') === 'string' ) {
    switch (schema.format) {
      case 'date':
        return moment__WEBPACK_IMPORTED_MODULE_4___default()(chance.date()).format('YYYY-MM-DD')
      case 'date-time':
        return `${moment__WEBPACK_IMPORTED_MODULE_4___default()(chance.date()).format('YYYY-MM-DDThh:mm:ss')}Z`
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
  } else if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'type') === 'number' ) {
    return chance.floating({ min: schema.minimum, max: schema.maximum })
  } else if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'type') === 'integer' ) {
    const size = lodash__WEBPACK_IMPORTED_MODULE_3___default.a.result(lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(brothers, lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'x-mock-array-key')), 'x-mock-array-size')
    if ( size ) {
      return size
    } else {
      return chance.integer({ min: schema.minimum, max: schema.maximum })
    }
  } else if ( lodash__WEBPACK_IMPORTED_MODULE_3___default.a.get(schema, 'type') === 'boolean' ) {
    return chance.bool()
  }
  // [TODO] allOf, oneOf, anyOf
  return schema
}


/***/ })
/******/ ]);