$(function() {
  var heartScene, scrollMagicController;
  scrollMagicController = new ScrollMagic.Controller;
  heartScene = new ScrollMagic.Scene({
    triggerElement: '#our-story',
    offset: -100,
    duration: 300
  });
  heartScene.setClassToggle('body', 'active');
  heartScene.setTween('#heart', 1.0, {
    color: 'rgb(111, 18, 0)',
    'font-size': '200px',
    left: '180px',
    rotation: 360
  });
  return heartScene.addTo(scrollMagicController);
});

$(function() {
  var colors, images;
  images = ['4726.jpeg', '6144.jpeg', '6147.jpeg', '6150.jpeg', '6153.jpeg', '6160.jpeg', '6163.jpeg', '6166.jpeg', '6170.jpeg', '6173.jpeg', '6176.jpeg', '6179.jpeg', '6182.jpeg', '6185.jpeg'];
  colors = ['#e9dce6', '#aa8ab3', '#6b4c75', '#cbd08e', '#b7cbe3', '#f1db8d'];
  images.forEach(function(image, index) {
    var $col, $h1, $heart, $image;
    $image = $('<img>');
    $col = $('#col-' + index % 3);
    $image.attr('src', 'images/' + image);
    $col.append($image);
    $heart = $('<i></i>');
    $heart.addClass('fa');
    $heart.addClass('fa-heart');
    $h1 = $('<h1></h1>');
    $h1.append($heart);
    $h1.css('color', colors[parseInt(Math.random() * colors.length)]);
    $col.append($h1);
  });
  $('#col-0 h1').last().remove();
  $('#col-1 h1').last().remove();
  return $('#col-2 h1').last().remove();
});

$(function() {
  smoothScroll.init({
    selector: '[data-scroll]',
    speed: 600,
    offset: 0,
    easing: 'easeInOutCubic',
    selectorHeader: '[data-scroll-header]'
  });
});