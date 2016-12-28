$(document).ready(function(){

  $("#reason").on("change", function(){
    adaptForm($(this).val());
  });

  var adaptForm = function(reason) {
    switch(reason) {
      case "gimp help":
        sectionVisibility(".system-info", "show");
        helpText("gimp help", "show");
        interactions();
        break;

      case "purchase help":
        helpText("purchase help", "show");
        sectionVisibility(".system-info, .contact-alert", "hide");
        interactions();
        break;

      case "business":
        sectionVisibility(".system-info, .better-question-prompt, .contact-alert", "hide");
        adaptHelpText("business", "hide");
        break;

      case "other":
        sectionVisibility(".system-info, .better-question-prompt, .contact-alert", "hide");
        adaptHelpText("other", "hide");
        break;
    }
  };

  var sectionVisibility = function(section, visibility) {
    if (visibility == "show") {
      $(section).removeClass("contact-hide").addClass("contact-show");
    }
    else if (visibility == "hide") {
      $(section).removeClass("contact-show").addClass("contact-hide");
    }
    else if (visibility == "dismiss") {
      $(section).removeClass("contact-show").addClass("contact-hide dismissed");
    }
  };

  var helpText = function(reason, visibility) {
    var reasonClass = "." + reason.replace(/\s/g, "-");
    $(".better-question-step").hide();
    $("#better-question-reason").text(reason).addClass("contact-" + visibility);
    $(".better-question-step" + reasonClass ).show();
  };

  var interactions = function(){
    $("#contact_message_content").focus(function(){
      if ($(".better-question-prompt").hasClass("dismissed")) {
        return
      }
      else {
        sectionVisibility(".better-question-prompt", "show");
      }
    });

    $(".dismiss-button").click(function(){
      sectionVisibility(".better-question-prompt", "dismiss");
      $(".activate-prompt-button").addClass("button-show");
    });

    $(".activate-prompt-button").click(function(){
      sectionVisibility(".better-question-prompt", "show");
    });
  };
});
