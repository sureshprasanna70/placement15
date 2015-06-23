$(document).ready(function(){
$('#faq').accordion();
$('.ticker1').easyTicker({
    direction: 'up',
    easing: 'swing',
    speed: 'slow',
    interval: 2000,
    height: 'auto',
    visible: 3,
    mousePause: 1,
    controls: {
          up: '',
      down: '',
      toggle: '',
      playText: 'Play',
      stopText: 'Stop'
    }
});
});
