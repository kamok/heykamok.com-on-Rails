//jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

//ka-face bounce
$(function() {
  if ($('#intro').length > 0) {
    var animationName = 'animated bounce';
    var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
    $(window).scroll(function() {
       var hT = $('#ka-portrait').offset().top,
           hH = $('#ka-portrait').outerHeight(),
           wH = $(window).height(),
           wS = $(this).scrollTop();
        // console.log((hT+hH-wH) , wS); 
        // "If confused, enable this and scroll up and down"
       if (wS > (hT+hH-wH)){
          $("#ka-face").addClass(animationName);

          setTimeout(function() {
            $("#ka-face").removeClass(animationName);
          }, 15000);
       }
    });
  }
});