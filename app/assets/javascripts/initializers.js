$(function() {

    $('.nav li').each(function() {
        if (window.location.href.indexOf($(this).find('a:first').attr('href')) > -1) {
            $(this).addClass('active').siblings().removeClass('active');
        }
    });

    $('.page-fade').addClass('faade');

    $('.wysihtml5').each(function (i, elem) {
        $(elem).wysihtml5();
    });

    $('.reviews').tooltip({
        html: true,
        delay: {
            show: 250,
            hide: 250
        }
    });
});
