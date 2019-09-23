
    $('.js-nav').slick({
        dots: false,
        autoplay: false,
        slidesToScroll: 1,
        slidesToShow:7
    });
    $('.menu-sub').mCustomScrollbar({
        scrollInertia: 150
    });
    $('#mCSB_1').css('overflow','visible');
    $('.banner .item1').hover(function() {
            $('.banner').css('border-bottom-color', '#20c2ff');
        },
        function() {
            $('.banner').css('border-bottom-color', '#20c2ff');
        });
    $('.banner .item2').hover(function() {
            $('.banner').css('border-bottom-color', '#fccd00');
        },
        function() {
            $('.banner').css('border-bottom-color', '#20c2ff');
        });
    $('.banner .item3').hover(function() {
            $('.banner').css('border-bottom-color', '#8fcf3e');
        },
        function() {
            $('.banner').css('border-bottom-color', '#20c2ff');
        });
    $('.banner .item4').hover(function() {
            $('.banner').css('border-bottom-color', '#592e2e');
        },
        function() {
            $('.banner').css('border-bottom-color', '#20c2ff');
        });

    function Height() {
        var H = $(window).height();
        $('.menu').css('height', H);
        $('.content').css('height', H - 70);
        $("#ipage").height($(window).height()-80);
        // $('#ipage').mCustomScrollbar({
        //     scrollInertia: 150
        // });
    }
    Height();
    $(window).resize(function() {
        //$('.content').mCustomScrollbar("destroy");
        Height();
    });
