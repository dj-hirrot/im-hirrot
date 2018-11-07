//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require social-share-button
//= require activestorage
//= require turbolinks
//= require_tree .
document.addEventListener('turbolinks:load', function() {
  // hide header
  var startPos = 0, winScrollTop = 0;
  $(window).on('scroll', function() {
    winScrollTop = $(this).scrollTop();
    if (winScrollTop >= startPos) {
      $('#header').addClass('hide');
    } else {
      $('#header').removeClass('hide');
    }
    startPos = winScrollTop;
  });

  // navigation
  $(".navToggle").click (function(){
    $(this).toggleClass("open");
    $("nav").toggleClass("open");
  });

  // skills
  // graph
  $('.skillbar').each(function(){
    $(this).find('.skillbar-bar').animate({
      width:$(this).attr('data-percent')
    },2000);
  });

  // tabs
  $('.tab li').click(function() {
    var index = $('.tab li').index(this);
    $('.tab-content li').css('display','none');
    $('.tab-content li').eq(index).css('display','block');
    $('.tab li').removeClass('select');
    $(this).addClass('select')
  });

  var nav = $('.tabs');
  var line = $('<div />').addClass('under-line');
  line.appendTo(nav);
  var active = nav.find('.active');
  var pos = 0;
  var wid = 0;

  if(active.length) {
    pos = active.position().left;
    wid = active.width();
    line.css({
      left: pos,
      width: wid
    });
  }

  // animation
  nav.find('ul li a').click(function(e) {
    e.preventDefault();
    if(!$(this).parent().hasClass('active') && !nav.hasClass('animate')) {
      nav.addClass('animate');
      var _this = $(this);
      nav.find('ul li').removeClass('active');
      var position = _this.parent().position();
      var width = _this.parent().width();

      if(position.left >= pos) {
        line.animate({
          width: ((position.left - pos) + width)
        }, 300, function() {
          line.animate({
            width: width,
            left: position.left
          }, 150, function() {
            nav.removeClass('animate');
          });
          _this.parent().addClass('active');
        });
      } else {
        line.animate({
          left: position.left,
          width: ((pos - position.left) + wid)
        }, 300, function() {
          line.animate({
            width: width
          }, 150, function() {
            nav.removeClass('animate');
          });
          _this.parent().addClass('active');
        });
      }

      pos = position.left;
      wid = width;
    }
  });
});
