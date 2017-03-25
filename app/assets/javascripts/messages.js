$(function() {
  function buildHTML(message) {
    var userName = $('#user-name').text();
    var messageImage = message.image ? `<img src="${message.image}" alt="Plofile fb n">` : `` ;
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
    var fileField = $('#message_image');
    if ( textField.val() || fileField.val()) {
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
        return false;
      })
    } else {
      alert('メッセージを入力してください');
    };
  });

  // setTimeout(function() {
  //   location.reload();
  // }, 10000);
});
