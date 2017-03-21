$(function() {
  function buildHTML(message) {
    console.log(message)
    var userName = $('#side-bar .header p').text();
    var html = $('<li class="message">').append('<p class="message__name">' + userName + '<span>' + message.created_at  + '</span></p><p class="message__text">' + message.text + '</p>');
    return html;
  };

  $('.form-wrapper form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.form-wrapper  form .text');
    var message = textField.val();
    var s = $(location).attr('pathname');
    s = s.split('/');
    $.ajax({
      type: 'POST',
      url: '/groups/' + s[2] + '/messages',
      data: {
        message: {
          text: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.container ul').append(html);
      textField.val();
    })
    .fail(function() {
    });
  });
});
