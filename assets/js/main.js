/*


    Edwin Patrick Cesar
    edwinpjdcesar@gmail.com
    edwincesar.com
    main.js


*/

$(document).ready(function () {

    // scrollspy and smooth scroll
    $('a[href*=#][class*="link-heading smooth"]:not([href=#])').click(function () {
        $('html, body').animate({
            scrollTop: $($(this).attr('href')).offset().top
        }, 500);
        return false;
    });

    $('body').scrollspy({ target: '#theNav' });

    $('[data-spy="scroll"]').each(function () {
        var $spy = $(this).scrollspy('refresh')
    });

});

