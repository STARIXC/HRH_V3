
$('.next').click(function () {
    $('.pills > .nav-item > .active').parent().next('li').find('a').trigger('click');
});

$('.previous').click(function () {
    $('.pills > .nav-item > .active').parent().prev('li').find('a').trigger('click');
});