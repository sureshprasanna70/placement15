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
//= require jquery-ui
//= require jquery.turbolinks
//= require introjs
//= require select2
//= require_tree .
$(document).ajaxStart(function(){
  $("#ajaxloader").html("<center><img src='/assets/378.GIF' width=212px height=13px></img></center>");
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
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-47367944-4', 'auto');
    ga('send', 'pageview');

  });
