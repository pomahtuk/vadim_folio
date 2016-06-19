$(function () {

  var BackgroundVideoPlayers = [];

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

  function stopAllVideoPlayers() {
    var players = BackgroundVideoPlayers;

    Object.keys(players).forEach(function (playerId) {
      players[playerId].pauseVideo();
    });
  }

  // $('.swiper-slide.botanika-house-slides-slider-wrapper, .botanika-page.image-slider').each((index, item) => {
  //   let $item = $(item),
  //     itemData = $item.data() || {};
  //
  //   if (itemData.url) {
  //     let $videoElem = $(`<div id=${itemData.url}></div>`).prependTo($item);
  //
  //     $videoElem.YTPlayer({
  //       fitToBackground: true,
  //       videoId: itemData.url,
  //       pauseOnScroll: true,
  //       playerVars: {
  //         modestbranding: 1,
  //
  //       },
  //       callback: function() {
  //         let player = $videoElem.data('ytPlayer').player;
  //         player.pauseVideo();
  //         BackgroundVideoPlayers[itemData.url] = player;
  //       }
  //     });
  //   }
  // }

  var swiperV = new Swiper('.swiper-container-v', {
    paginationClickable: true,
    direction: 'vertical',
    slidesPerView: 1,
    mousewheelControl: true,
    spaceBetween: 0,
    hashnav: true,
    parallax: true,
    speed: 1000,
    grabCursor: false,
    keyboardControl: true,
    mousewheelForceToAxis: true,
    // onSlideChangeEnd: function (swiper) {
    //   let $element = $(swiper.slides[swiper.activeIndex]),
    //     $videoContainer = $element.find('[data-url]'),
    //     videoUrl = $videoContainer.data('url');
    //
    //   if ($videoContainer.length > 0) {
    //     stopAllVideoPlayers();
    //
    //     // dirty hack! should be using some smarter solution
    //     let playerSeekingInterval = setInterval(function() {
    //       let player = BackgroundVideoPlayers[videoUrl];
    //       if (player) {
    //         clearInterval(playerSeekingInterval);
    //         player.playVideo();
    //       }
    //     }, 100);
    //   }
    //
    // }
  });

  $('.menu-item .menu-item-link, .menu-to-home').click(function (evt) {
    var $elem = $(this),
      index = 0,
      slug = $elem.attr('href');

    // cut off a hash
    slug = slug.split('#')[1];

    if (slug) {
      evt.preventDefault();
      index = $(`[data-hash=${slug}]`).index();
    }

    swiperV.slideTo(index);

  });

});
