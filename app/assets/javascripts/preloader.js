// wtf is wrong with this function!!!

$(document).ready(function () {
    $(window).load(setTimeout(function () {
        $('#preloader').fadeOut('slow', function() {
            $(this).remove();
        });
    }, 500));
});