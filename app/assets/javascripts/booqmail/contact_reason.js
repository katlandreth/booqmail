$(document).ready(function(){

  $("#reason").on("change", function(){
    adaptForm($(this).val());
  });

  var adaptForm = function(reason) {
    switch(reason) {
      case "gimp help":
        adaptSectionVisibility(".system-info, .better-question-prompt", "show");
        adaptHelpText("gimp help", "show");
        break;

      case "purchase help":
        adaptSectionVisibility(".system-info, .contact-alert", "hide");
        adaptSectionVisibility(".better-question-prompt", "show");
        adaptHelpText("purchase help", "show");
        break;

      case "business":
        adaptSectionVisibility(".system-info, .better-question-prompt, .contact-alert", "hide");
        adaptHelpText("", "hide");
        break;

      case "other":
        adaptSectionVisibility(".system-info, .better-question-prompt, .contact-alert", "hide");
        adaptHelpText("", "hide");
        break;
    }
  };

  var adaptSectionVisibility = function(section, visibility) {
    if (visibility == "show") {
      $(section).removeClass("contact-hide").addClass("contact-show");
    }
    else {
      $(section).removeClass("contact-show").addClass("contact-hide");
    }
  };

  var adaptHelpText = function(reason, visibility) {
    if (visibility == "show") {
      $("#better-question-reason").text(reason);
    }
    else {
      $("#better-question-reason").text("");
    }
  };

});
