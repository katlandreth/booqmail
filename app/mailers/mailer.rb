class Mailer < ApplicationMailer
  default to: "contacthowtogimp@gmail.com"

  def contact_me(message)
    @message = message
    if message.image
      attachment_name = message.image.original_filename
      attachments[attachment_name] = message.image.read
    end
    mail(from: @message.email,
         subject: "How to GIMP Contact Form",
         body: @message.content) do |format|
           format.html { render layout: 'mailer.html.erb' }
           format.text
         end
  end
end
