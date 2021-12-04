$(document).ready(function(){
  var gnbdiv = $('.gnb > li > div');
  var bg = $('.bg_gnb');
  var li = $('.gnb > li');

  li.on('mouseover focusin', function(){
    hig = 0;
    gnbdiv.each(function(){
      temp = parseInt($(this).outerHeight());
      if(hig <= temp){
        hig = temp;
      }
    });
    gnbdiv.show().css('height', hig);
    bg.show().css('height', hig);
  });

  li.on('mouseleave', function(){
    hide_el();
  });

  $('.lang, h1').on('focusin', function(){
    hide_el();
  });

  function hide_el(){
    gnbdiv.hide().removeAttr('style');
    bg.hide().removeAttr('style');
  }
});
