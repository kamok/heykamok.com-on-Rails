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