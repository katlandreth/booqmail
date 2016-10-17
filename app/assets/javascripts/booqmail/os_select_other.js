$(document).ready(function(){
  $("#version_select").on("change", function(){
    if ($("#version_select option:selected").text() == "other") {
      $(".message-content .contact-alert").removeClass("contact-hide").addClass("contact-show");
    }
    else {
      $(".message-content .contact-alert").removeClass("contact-show").addClass("contact-hide");
    }
  });
});
