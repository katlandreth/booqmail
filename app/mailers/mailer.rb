class Mailer < ApplicationMailer
  default to: "contacthowtogimp@gmail.com"

  def contact_me(message)
    @message = message
    @os_version = OsVersion.find(@message.os_version_id)
    @operating_system = OperatingSystem.find(@message.operating_system_id)
    if message.image
      attachment_name = message.image.original_filename
      attachments[attachment_name] = message.image.read
    end
    mail(from: @message.email,
         subject: @message.subject,
         body: @message.content) do |format|
           format.html { render layout: 'mailer.html.erb' }
           format.text
         end
  end
end
