document.addEventListener("DOMContentLoaded", function(){
  // Phase I: Setting up your Canvas Element
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;
  const ctx = canvasEl.getContext("2d");

  // Phase II: Draw a Rectangle
  ctx.fillStyle = "gold";
  ctx.fillRect(0, 0, 500, 500); // ctx.fillRect(x, y, width, height);

  // Phase III: Draw a Circle
  ctx.beginPath();
  // ctx.arc(x, y, radius, startAngle, endAngle [, anticlockwise]);
  ctx.arc(275, 275, 99, 0, 2 * Math.PI);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 5;
  ctx.stroke(); // green circle
  ctx.fillStyle = "darkgray";
  ctx.fill();

  //Phase IV: Draw Quadratic Bezier curves
  // to render a speech ballon
  // Quadratric curves example
  ctx.beginPath();
  ctx.moveTo(75, 25);
  ctx.quadraticCurveTo(25, 25, 25, 62.5);
  ctx.quadraticCurveTo(25, 100, 50, 100);
  ctx.quadraticCurveTo(50, 120, 30, 125);
  ctx.quadraticCurveTo(60, 120, 65, 100);
  ctx.quadraticCurveTo(125, 100, 125, 62.5);
  ctx.quadraticCurveTo(125, 25, 75, 25);
  ctx.strokeStyle = "black";
  ctx.lineWidth = 2;
  ctx.stroke();
});
