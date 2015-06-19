// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require introjs
//= require_tree .
$(document).ajaxStart(function(){
  $("#ajaxloader").html("<center><img src='/assets/loading.GIF' width=30px></img></center>");
});
$(document).ajaxComplete(function(){
  $("#ajaxloader").html(" ");
});

$.material.init()
  $(document).ready(function(){
    var intro = introJs();
    intro.setOptions({
      steps: [
    {
      element: '#home',
      intro: "This is a <b>bold</b> tooltip."
    },
      {
        element: '#resume',
      intro: "Ok, <i>wasn't</i> that fun?",
      position: 'right'
      },
      {
        element: '#step3',
      intro: 'More features, more <span style="color: red;">f</span><span style="color: green;">u</span><span style="color: blue;">n</span>.',
      position: 'left'
      }]
    });
$('#sitetour').on('click',function(e){
  console.log("hello");
  e.preventDefault();
    intro.start();
});
  });
