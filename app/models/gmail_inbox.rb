class GmailInbox
 attr_accessor :inbox, :message

  def initialize
    @gmail = Gmail.connect!(ENV['GMAIL_USERNAME'], ENV['GMAIL_PASSWORD'])
  end

  def inbox
    @gmail.inbox.emails()
  end

  
end  #end Email class
