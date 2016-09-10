$ ->
  reservation = localStorage.getItem 'reservation'
  reservation = $.parseJSON(reservation) if reservation?

  song = null
  if Math.random() > 0.5
    song = 'i_choose_you'
  else
    song = 'marry_me'

  rendered = Mustache.render $('#music').html(), song
  $('body').append $(rendered)

  postUpdate = ->
    $.ajax
      type: "PUT"
      contentType : 'application/json'
      processData : false
      data: JSON.stringify reservation
      url: "http://localhost:8081/reservations/#{reservation._id}"
      beforeSend: (request) ->
        request.setRequestHeader "Authorization", "#{reservation.username} #{reservation.password}"
      success: (data) ->
        console.log 'saved'
      error: (XMLHttpRequest, textStatus, errorThrown) ->
        console.log 'invalid login info'
      dataType: 'json'

  updateModel = (name, key, value) ->
    member = _.find reservation.party, name: name
    member[key] = value
    refreshMembers()
    postUpdate()

  $('#rsvp #party').on 'click', '.vegetarian-set', (evt) ->
    updateModel $(this).data('name'), 'isVegetarian', false

  $('#rsvp').on 'click', '.vegetarian-unset', (evt) ->
    updateModel $(this).data('name'), 'isVegetarian', true

  $('#rsvp').on 'click', '.rsvp-set', (evt) ->
    updateModel $(this).data('name'), 'reserved', true

  $('#rsvp').on 'click', '.rsvp-unset', (evt) ->
    updateModel $(this).data('name'), 'reserved', false

  hideModal = ->
    $('.login-modal').hide()
    $('body').css 'overflow', 'auto'
    smoothScroll.animateScroll '#main'

  showModal = ->
    $('.login-modal').show()
    $('body').css 'overflow', 'hidden'

  refreshMembers = ->
    $party = $('#party')
    $party.empty()
    for member in reservation.party
      rendered = Mustache.render $('#member').html(), member
      $party.append $(rendered)

  login = ->
    username = reservation?.username || $('#username').val()
    password = reservation?.password || $('#password').val()
    $.ajax
      type: "POST"
      url: 'http://localhost:8081/login'
      beforeSend: (request) ->
        request.setRequestHeader "Authorization", "#{username} #{password}"
      success: (data) ->
        hideModal()
        reservation = data
        localStorage.setItem 'reservation', JSON.stringify reservation
        refreshMembers()
      error: (XMLHttpRequest, textStatus, errorThrown) ->
        reservation = null
        showModal()
      dataType: 'json'

  if reservation?
    hideModal()
    login()

  $('#login').click login

$ ->
  scrollMagicController = new (ScrollMagic.Controller)
  heartScene = new (ScrollMagic.Scene)(
    triggerElement: '#our-story'
    offset: -100
    duration: 300)
  heartScene.setClassToggle 'body', 'active'
  heartScene.setTween '#heart', 1.0,
    color: 'rgb(111, 18, 0)'
    'font-size': '200px'
    left: '180px'
    rotation: 360
  heartScene.addTo scrollMagicController

$ ->
  images = [
    '4726.jpeg'
    '6144.jpeg'
    '6147.jpeg'
    '6150.jpeg'
    '6153.jpeg'
    '6160.jpeg'
    '6163.jpeg'
    '6166.jpeg'
    '6170.jpeg'
    '6173.jpeg'
    '6176.jpeg'
    '6179.jpeg'
    '6182.jpeg'
    '6185.jpeg'
  ]
  colors = [
    '#e9dce6'
    '#aa8ab3'
    '#6b4c75'
    '#cbd08e'
    '#b7cbe3'
    '#f1db8d'
  ]
  images.forEach (image, index) ->
    $image = $('<img>')
    $col = $('#col-' + index % 3)
    $image.attr 'src', 'images/' + image
    $col.append $image
    $heart = $('<i></i>')
    $heart.addClass 'fa'
    $heart.addClass 'fa-heart'
    $h1 = $('<h1></h1>')
    $h1.append $heart
    $h1.css 'color', colors[parseInt(Math.random() * colors.length)]
    $col.append $h1
    return
  $('#col-0 h1').last().remove()
  $('#col-1 h1').last().remove()
  $('#col-2 h1').last().remove()

$ ->
  smoothScroll.init
    selector: '[data-scroll]'
    speed: 600
    offset: 0
    easing: 'easeInOutCubic'
    selectorHeader: '[data-scroll-header]'
  return
