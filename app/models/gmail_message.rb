class GmailMessage < Gmail::Message
  attr_accessor :email_body, :email_attachment

  def initialize(id = nil)
    @gmail = Gmail.connect!(ENV['GMAIL_USERNAME'], ENV['GMAIL_PASSWORD'])
    @uid = id
  end

  def email
    @message = @gmail.inbox.emails(uid: @uid).first
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

  def original_from
    @message = @gmail.inbox.emails(uid: @uid).first
    if @message.header[:'X-Google-Original-From'] != nil
      @message.header[:'X-Google-Original-From'].value
    else
      @message.message.from[0]
    end
  end

  def reply(options = {})
    @gmail.deliver! do
      to options[:send_to]
      subject options[:subject]
      text_part do
        body options[:message_body]
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body options[:message_body]
      end
      if options[:message_attachment] != nil
        add_file filename: options[:message_attachment].original_filename, content: File.read(options[:message_attachment].tempfile)
      end
    end
  end
end #end Message class
