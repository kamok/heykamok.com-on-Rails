// This function which implements a 0.5 secods delay returns an error
// Doesn't affect functionality but it annoys me
// I'll skip the delay and simpy get rid of the preload spinner

// $(function () {
//     $(window).load(setTimeout(function () {
//         $('#preloader').fadeOut('slow', function() {
//             $(this).remove();
//         });
//     }, 500));
// });

$(function () {
    $(window).load(function () {
        $('#preloader').fadeOut('slow', function() {
            $(this).remove();
        });
    });
});