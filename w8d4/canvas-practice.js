document.addEventListener("DOMContentLoaded", function() {
  // Your code here
  let canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.height = 500;
  let ctx = canvas.getContext('2d');
  ctx.fillStyle = "red";
  ctx.fillRect(50,50,400,250);

  ctx.beginPath();
  ctx.arc(250,250,100,0,360);
  ctx.strokeStyle = "purple";
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = "pink";
  ctx.fill()
});