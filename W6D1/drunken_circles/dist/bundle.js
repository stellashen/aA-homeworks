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
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
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
/******/ 	return __webpack_require__(__webpack_require__.s = "./dist/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./dist/main.js":
/*!**********************!*\
  !*** ./dist/main.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ../lib/game.js */ \"./lib/game.js\");\n\nconst canvasEl = document.getElementsByTagName(\"canvas\")[0];\ncanvasEl.height = window.innerHeight;\ncanvasEl.width = window.innerWidth;\nnew Game(\n  canvasEl.width,\n  canvasEl.height\n).start(canvasEl);\n\n\n//# sourceURL=webpack:///./dist/main.js?");

/***/ }),

/***/ "./lib/circle.js":
/*!***********************!*\
  !*** ./lib/circle.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Circle =  function (centerX, centerY, radius, color) {\n  this.centerX = centerX;\n  this.centerY = centerY;\n  this.radius = radius;\n  this.color = color;\n};\n\nCircle.randomCircle = function (maxX, maxY, numCircles) {\n  return new Circle(\n    maxX * Math.random(),\n    maxY * Math.random(),\n    Circle.radius(maxX, maxY, numCircles),\n    Circle.randomColor()\n  );\n};\n\nconst HEX_DIGITS = \"0123456789ABCDEF\";\n\nCircle.randomColor = function () {\n  let color = \"#\";\n  for (let i = 0; i < 6; i++) {\n    color += HEX_DIGITS[Math.floor((Math.random() * 16))];\n  }\n\n  return color;\n};\n\nCircle.radius = function (maxX, maxY, numCircles) {\n  let targetCircleArea = (maxX * maxY) / numCircles;\n  let targetRadius = Math.sqrt(targetCircleArea / Math.PI);\n  return 2 * targetRadius;\n};\n\nCircle.prototype.moveRandom = function (maxX, maxY) {\n  let dx = (Math.random() * 2) - 1;\n  let dy = (Math.random() * 2) - 1;\n\n  this.centerX = Math.abs((this.centerX + (dx * this.radius * 0.1)) % maxX);\n  this.centerY = Math.abs((this.centerY + (dy * this.radius) * 0.1) % maxY);\n};\n\nCircle.prototype.render = function (ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.centerX,\n    this.centerY,\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n\n  ctx.fill();\n};\n\nmodule.exports = Circle;\n\n\n//# sourceURL=webpack:///./lib/circle.js?");

/***/ }),

/***/ "./lib/game.js":
/*!*********************!*\
  !*** ./lib/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Circle = __webpack_require__(/*! ./circle.js */ \"./lib/circle.js\");\n\nconst circles = [];\n\nwindow.Game = function (xDim, yDim) {\n  this.xDim = xDim;\n  this.yDim = yDim;\n\n  for (let i = 0; i < Game.NUM_CIRCLES; ++i) {\n    circles.push(\n      Circle.randomCircle(xDim, yDim, Game.NUM_CIRCLES)\n    );\n  }\n};\n\nGame.NUM_CIRCLES = 4000;\n\nGame.prototype.render = function (ctx) {\n  //this will empty the canvas\n  ctx.clearRect(0, 0, this.xDim, this.yDim);\n\n  circles.forEach(function (circle) {\n    circle.render(ctx);\n  });\n};\n\nGame.prototype.moveCircles = function () {\n  circles.forEach( circle => {\n    circle.moveRandom(this.xDim, this.yDim);\n  });\n};\n\nGame.prototype.start = function (canvasEl) {\n  // get a 2d canvas drawing context. The canvas API lets us call\n  // a `getContext` method on a canvas DOM element.\n  const ctx = canvasEl.getContext(\"2d\");\n\n  //this function will update the position of all the circles,\n  //clear the canvas, and redraw them\n  const animateCallback = () => {\n    this.moveCircles();\n    this.render(ctx);\n    //this will call our animateCallback again, but only when the browser\n    //is ready, usually every 1/60th of a second\n    requestAnimationFrame(animateCallback);\n\n    //if we didn't know about requestAnimationFrame, we could use setTimeout\n    //setTimeout(animateCallback, 1000/60);\n  };\n\n  //this will cause the first render and start the endless triggering of\n  //the function using requestAnimationFrame\n  animateCallback();\n};\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./lib/game.js?");

/***/ })

/******/ });