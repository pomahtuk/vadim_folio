$(function () {
  var slideout = new Slideout({
    'panel': document.getElementById('main'),
    'menu': document.getElementById('menu'),
    'padding': -300,
    'tolerance': 70
  });

  $('.js-slideout-toggle').click(function () {
    slideout.toggle();
  });
  $('.menu-item-link, .menu-to-home, #main').click(function () {
    slideout.close();
  });

  $('a.portfolio-logo').click(function () {
    window.swiperV.slideTo(0);
    return false;
  })

  $('.menu-item .menu-item-link, .menu-to-home, .porfolio-work-item-in-list').click(function (evt) {
    var $elem = $(this),
      index = 0,
      slug = $elem.attr('href');

    // cut off a hash
    slug = slug.split('#')[1];

    if (slug) {
      evt.preventDefault();
      index = $('[data-hash=' + slug + ']').index();
    }

    window.swiperV.slideTo(index);

    return false;

  });
})
