$(function () {

  window.BackgroundVideoPlayers = {};

  function stopAllVideoPlayers() {
    var players = window.BackgroundVideoPlayers;
    Object.keys(players).forEach(function (playerId) {
      players[playerId].pauseVideo();
    });
  }

  function swiperSlideChangeCallback (swiper) {
    var $element = $(swiper.slides[swiper.activeIndex]),
      videoUrl = $element.data('url');

    stopAllVideoPlayers();

    if (videoUrl) {
      // dirty hack! should be using some smarter solution
      var playerSeekingInterval = setInterval(function() {
        var player = window.BackgroundVideoPlayers[videoUrl];
        if (player) {
          clearInterval(playerSeekingInterval);
          player.playVideo();
        }
      }, 100);
    }
  }

  $('#main .swiper-slide[data-url]').each(function (index, item) {
    var $item = $(item),
      itemData = $item.data() || {};

    if (itemData.url) {
      var $videoElem = $('<div class="video-player-div" id="' + itemData.url + '"></div>').prependTo($item);

      $videoElem.YTPlayer({
        fitToBackground: true,
        videoId: itemData.url,
        pauseOnScroll: true,
        playerVars: {
          modestbranding: 1,
        },
        callback: function() {
          var player = $videoElem.data('ytPlayer').player,
            slug = $item.data('hash'),
            parentSlug = $item.parents('.swiper-slide').first().data('hash'),
            index = $('[data-hash=' + slug + ']').index(),
            parentIndex = $('[data-hash=' + parentSlug + ']').index();

          player.pauseVideo();
          window.BackgroundVideoPlayers[itemData.url] = player;
          // be smarter - resume video if we are on this slide from very beginning
          // does not apply for sliders inside
          if (window.swiperV.activeIndex == index || window.swiperV.activeIndex == parentIndex) {
            player.playVideo();
          }
        }
      });
    }
  });

  window.swiperV = new Swiper('.swiper-container-v', {
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
    onSlideChangeEnd: swiperSlideChangeCallback
  });

  var listSwiperSettings = {
    slidesPerView: 'auto',
    paginationClickable: true,
    spaceBetween: 20,
    roundLengths: true,
    grabCursor: false,
    onSlideChangeEnd: swiperSlideChangeCallback,
    // threshold: 50,
    // shortSwipes: false
  }

  var swiperNews = new Swiper('.swiper-container-news', $.extend({}, listSwiperSettings, {
    pagination: '.swiper-pagination-news',
  }));

  var swiperRecommendations = new Swiper('.swiper-container-recommendations', $.extend({}, listSwiperSettings, {
    pagination: '.swiper-pagination-recommendations',
  }));

  $('.portfolio-page.image-slider.image-slider--work, .portfolio-page.image-slider.image-slider--profile').each(function (index, elem) {
    var $elem = $(elem);

    var swiperElement = $elem.find('.swiper-container-h').get(0),
      swiperPagination = $elem.find('.swiper-pagination-h').get(0);

    var swiper = new Swiper(swiperElement, {
      pagination: swiperPagination,
      slidesPerView: 1,
      paginationClickable: true,
      spaceBetween: 0,
      grabCursor: false,
      parallax: true,
      speed: 750,
      grabCursor: false,
      keyboardControl: true,
      onSlideChangeEnd: swiperSlideChangeCallback
      // threshold: 50,
      // shortSwipes: false
    });
  });

});
