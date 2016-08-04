// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-tour.min
//= require bootstrap-wysihtml5
//= require angular
//= require angular-animate
//= require angular-resource

//= require weatherman/weather.module
//= require weatherman/weather.factory
//= require weatherman/weather.controller
//= require weatherman/weather.model

//= require_self

//WYSIWYG
$(document).ready(function(){
  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({ toolbar:{ "fa": true, 'html': true} });
  });
	// Instance the tour
	var tour = new Tour({
	  steps: [
	  {	element: "#bootstrap-tour-selector",
	    title: "A word for first time visitors",
	    content: "You can use these buttons on the left to scroll down this page."
	  }],
	  template: 
	  "<div class='popover tour'><div class='arrow'></div><h3 class='popover-title' style='font-weight:bold;'></h3><div class='popover-content'></div><button class='btn btn-default' style='margin-left:14px; margin-bottom:5px;' data-role='end'>Okay.</button></div>",
	});

	// Initialize the tour
	tour.init();

	// Start the tour
	tour.start();
});