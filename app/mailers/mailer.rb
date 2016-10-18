class Mailer < ApplicationMailer
  default to: "contacthowtogimp@gmail.com"

  def contact_me(message)
    @message = message
    @os_version_name = find_version(@message.os_version_id, OsVersion)
    @operating_system_name = find_version(@message.operating_system_id, OperatingSystem)
    @gimp_version = find_version(@message.gimp_version, GimpVersion)
    if message.image
      attachment_name = message.image.original_filename
      attachments[attachment_name] = message.image.read
    end
    mail(from: @message.email,
         subject: "*" + @message.reason + "* " + @message.subject,
         body: @message.content) do |format|
           format.html { render layout: 'mailer.html.erb' }
           format.text
         end
  end

  def find_version(attribute, object)
    if attribute.present?
     object.find(attribute).name
    else
     "not provided"
    end
  end

end
