$(document).ready(function(){
  $("#version_select").on("change", function(){
    if ($("#version_select option:selected").text() == "other") {
      $(".contact-alert").removeClass("contact-hide").addClass("contact-show");
    }
    else {
      $(".contact-alert").removeClass("contact-show").addClass("contact-hide");
    }
  });
});
