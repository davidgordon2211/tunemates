function rand(min, max) {
  return ((max-min) * Math.random()) + min;
}
function randint(min, max) {
  return Math.floor(rand(min, max));
}
function confetti(event) {
  var container = $('#confettis');
  var wH = container.innerHeight();
  var wW = container.innerWidth();

  var leftcursor = true;

  var move = 150;
  var angle = -6*Math.PI/10;
  var left = Math.cos(angle) * move;
  var top = Math.abs(Math.sin(angle) * move);

  $('<div class="confetti"></div>').appendTo(container).css({
    background: 'rgb(' + randint(0,255) + ', ' + randint(0,255) + ',' + randint(0,255) + ')',
    top: Math.random() * (wH),
    left: Math.random() * (wW),
    opacity: 0
  }).animate({
    top: '+=' + top,
    left: '+=' + left
  }, {
      queue: false,
      duration: 700
    }).animate({
    opacity: 1
  }, 350).animate({
    opacity: 0
  }, 350, function(){
    $(this).remove();
    setTimeout(confetti, randint(0,200));
  });
}
$(document).ready(function(e){
  for(var i = 0; i < 200; i++) {
    setTimeout(confetti, randint(0,200));
  }
  $(this).mousemove(function(e){
      window.mouseXPos = e.pageX;
      window.mouseYPos = e.pageY;
   });
  setInterval(cursor, 1000);
});
function cursor(){
  var wW = $('#confettis').innerWidth();
  var wH = $('#confettis').innerHeight();

  var left = wW/2 - window.mouseXPos;
  var top = window.mouseYPos;

  var angle = Math.atan2(-top, -left);
  if(angle < -6*Math.PI/10) {
    angle = -6*Math.PI/10;
  }
  if(angle > -4*Math.PI/10) {
    angle = -4*Math.PI/10;
  }
  angle = -Math.PI/2 - angle;
  console.log(angle);
  //$('.confetti').css('transform','skew(' + angle + 'rad)');
  if(!$('#c').length) {
    $('body').append('<style id="c"></style>');
  }
  $('#c').text(".confetti {transform: skew(" + -angle + "rad)}");
}
