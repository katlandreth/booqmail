class GmailMessage < Gmail::Message
  attr_accessor :email_body, :email_attachment

  def initialize(id)
    @gmail = Gmail.connect!(ENV['GMAIL_USERNAME'], ENV['GMAIL_PASSWORD'])
    @uid = id
  end

  def email_body
    @message = @gmail.inbox.emails(uid: @uid).first
    if @message.multipart?
      @message.html_part.body.decoded
    else
      @message.body.decoded
    end
  end

  def email_attachment
    @message = @gmail.inbox.emails(uid: @uid).first
   if @message.attachments.length > 0
     img = "<img src='data: #{@message.attachments.first.mime_type} ;base64, #{@message.attachments.first.body.encoded} '/>"
     img.html_safe
    else
      "no attachment"
    end
  end
end #end Message class
