$(document).ready(function(){

  $("#reason").on("change", function(){
    adaptForm($(this).val());
  });

  var adaptForm = function(reason) {
    switch(reason) {
      case "gimp help":
        adaptSectionVisibility(".system-info", "show");
        adaptHelpText("gimp help", "show");
        $("#contact_message_content").focus(function(){
          adaptSectionVisibility(".better-question-prompt", "show");
        });
        $("#contact_message_content").blur(function(){
          adaptSectionVisibility(".better-question-prompt", "hide");
        });
        $(".better-question-prompt .dismiss-button").blur(function(){
          adaptSectionVisibility(".better-question-prompt", "dismiss");
        });
        break;

      case "purchase help":
        adaptSectionVisibility(".system-info, .contact-alert", "hide");
        $("#contact_message_content").focus(function(){
          adaptSectionVisibility(".better-question-prompt", "show");
        });
        $("#contact_message_content").blur(function(){
          adaptSectionVisibility(".better-question-prompt", "hide");
        });
        adaptHelpText("purchase help", "show");
        break;

      case "business":
        adaptSectionVisibility(".system-info, .better-question-prompt, .contact-alert", "hide");
        adaptHelpText("business", "hide");
        break;

      case "other":
        adaptSectionVisibility(".system-info, .better-question-prompt, .contact-alert", "hide");
        adaptHelpText("other", "hide");
        break;
    }
  };

  var adaptSectionVisibility = function(section, visibility) {
    if (visibility == "show" && section.hasClass("dismissed")) {
      return
    }
    else if (visibility == "show") {
      $(section).removeClass("contact-hide").addClass("contact-show");
    }
    else if (visibility == "hide") {
      $(section).removeClass("contact-show").addClass("contact-hide");
    }
    else if (visibility == "dismiss") {
      $(section).removeClass("contact-show").addClass("contact-hide dismissed");
    }
  };

  var adaptHelpText = function(reason, visibility) {
    var reasonClass = "." + reason.replace(/\s/g, "-");
    console.log(reasonClass);
    $(".better-question-step").hide();
    $("#better-question-reason").text(reason).addClass("contact-" + visibility);
    $(".better-question-step" + reasonClass ).show();
  };

});
