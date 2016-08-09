$(document).ready(function(){
  if($('#message-body').length > 0) {
    var rawBody = $('#message-body').html();
    // var regex = /(<html>|<\/html>|<body>|<\/body>|&lt;html&gt;|&lt;body&gt;|&lt;\/body&gt;|&lt;\/html&gt;)/ig;
    // var stripedBody = rawBody.replace(regex, "");
    console.log(rawBody);
    $('#message-body').html( $('<div />').html(rawBody).text() );
  };
});
