$(function() {
  function buildHTML(message) {
    var userName = $('#user-name').text();
    if (!message.image) {
      var messageImage = ``;
    } else {
      var messageImage = `<img src="${message.image}" alt="Plofile fb n">`;
    };
    var html = $('<li class="message">').append(
          `<p class="message__name">
             ${userName}
             <span>
               ${message.created_at}
             </span>
           </p>
           <p class="message__text">
             ${message.text}
           </p>
           ${messageImage}`
          );
    return html;
  };

  $('#new_message').on('submit', function(e) {
    var $form = this;
    e.preventDefault();
    var textField = $('#message_text');
    var formData = new FormData($(this)[0]);
    $.ajax({
      type: 'POST',
      url: './messages.json',
      processData: false,
      contentType: false,
      data: formData
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('#messages').append(html);
      textField.val("");
      $form.reset();
    })
  });

  // setTimeout(function() {
  //   location.reload();
  // }, 10000);
});