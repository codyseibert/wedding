$ ->
  password = window.location.href.split('?')[1].split('=')[1]
  $.ajax
    type: "GET"
    url: 'http://localhost:8081/reservations'
    beforeSend: (request) ->
      request.setRequestHeader "Authorization", "admin #{password}"
    success: (reservations) ->
      reserved = 0
      vegetarians = 0

      for reservation in reservations
        for member in reservation.party
          reserved++ if member.reserved is true
          vegetarians++ if member.isVegetarian is true
          $table = $('table')
            .append(
              $('<tr></tr>')
              .append(
                $('<td></td>')
              )
              .append(
                $('<td></td>').append(member.name)
              )
              .append(
                $('<td></td>').append(member.isVegetarian)
              )
              .append(
                $('<td></td>').append(member.reserved)
              )
            )

      $('body')
        .append('<div></div>')
        .append('Reserved: ' + reserved)

      $('body')
        .append('<div></div>')
        .append('Vegetarians: ' + vegetarians)

    error: (XMLHttpRequest, textStatus, errorThrown) ->
      console.log 'error'
    dataType: 'json'
