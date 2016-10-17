$(document).ready(function(){
  $("#reason").on("change", function(){
    if ($(this).val() == "gimp help") {
      console.log($(this).val());
      $(".system-info").removeClass("contact-hide").addClass("contact-show");
    }
    else {
      console.log($(this).val());
      $(".system-info").removeClass("contact-show").addClass("contact-hide");
    }
  });
});
