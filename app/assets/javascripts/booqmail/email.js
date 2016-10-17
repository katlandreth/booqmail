$(document).ready(function(){
  if($('#message-body').length > 0) {
    var rawBody = $('#message-body').html();
    $('#message-body').html( $('<div />').html(rawBody).text() );
  };
});
