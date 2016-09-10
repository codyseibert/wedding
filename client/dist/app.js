$(function() {
  var hideModal, login, postUpdate, refreshMembers, rendered, reservation, showModal, song, updateModel;
  reservation = localStorage.getItem('reservation');
  if (reservation != null) {
    reservation = $.parseJSON(reservation);
  }
  song = null;
  if (Math.random() > 0.5) {
    song = 'i_choose_you';
  } else {
    song = 'marry_me';
  }
  rendered = Mustache.render($('#music').html(), song);
  $('body').append($(rendered));
  postUpdate = function() {
    return $.ajax({
      type: "PUT",
      contentType: 'application/json',
      processData: false,
      data: JSON.stringify(reservation),
      url: "http://localhost:8081/reservations/" + reservation._id,
      beforeSend: function(request) {
        return request.setRequestHeader("Authorization", reservation.username + " " + reservation.password);
      },
      success: function(data) {
        return console.log('saved');
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        return console.log('invalid login info');
      },
      dataType: 'json'
    });
  };
  updateModel = function(name, key, value) {
    var member;
    member = _.find(reservation.party, {
      name: name
    });
    member[key] = value;
    refreshMembers();
    return postUpdate();
  };
  $('#rsvp #party').on('click', '.vegetarian-set', function(evt) {
    return updateModel($(this).data('name'), 'isVegetarian', false);
  });
  $('#rsvp').on('click', '.vegetarian-unset', function(evt) {
    return updateModel($(this).data('name'), 'isVegetarian', true);
  });
  $('#rsvp').on('click', '.rsvp-set', function(evt) {
    return updateModel($(this).data('name'), 'reserved', true);
  });
  $('#rsvp').on('click', '.rsvp-unset', function(evt) {
    return updateModel($(this).data('name'), 'reserved', false);
  });
  hideModal = function() {
    $('.login-modal').hide();
    $('body').css('overflow', 'auto');
    return smoothScroll.animateScroll('#main');
  };
  showModal = function() {
    $('.login-modal').show();
    return $('body').css('overflow', 'hidden');
  };
  refreshMembers = function() {
    var $party, i, len, member, ref, results;
    $party = $('#party');
    $party.empty();
    ref = reservation.party;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      member = ref[i];
      rendered = Mustache.render($('#member').html(), member);
      results.push($party.append($(rendered)));
    }
    return results;
  };
  login = function() {
    var password, username;
    username = (reservation != null ? reservation.username : void 0) || $('#username').val();
    password = (reservation != null ? reservation.password : void 0) || $('#password').val();
    return $.ajax({
      type: "POST",
      url: 'http://localhost:8081/login',
      beforeSend: function(request) {
        return request.setRequestHeader("Authorization", username + " " + password);
      },
      success: function(data) {
        hideModal();
        reservation = data;
        localStorage.setItem('reservation', JSON.stringify(reservation));
        return refreshMembers();
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        reservation = null;
        return showModal();
      },
      dataType: 'json'
    });
  };
  if (reservation != null) {
    hideModal();
    login();
  }
  return $('#login').click(login);
});

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
