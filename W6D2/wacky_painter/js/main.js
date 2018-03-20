/* globals $ */

var View = require("./view");

// not sure whether an element with an id of #easel will be there
// so we wait until the DOM tells us it's there
$(function () {
  var $easel = $("#easel");
  new View($easel);
});
