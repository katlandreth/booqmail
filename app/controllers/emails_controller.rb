class EmailsController < ApplicationController
  #  before_action :connect

  def index
    @messages = GmailInbox.new().inbox
  end

  def show
     @message = GmailMessage.new(params[:id])
  end

  # def login
  #   render 'login'
  # end
  #
  # def create_session
  #   @email_session = Email.new()
  #   binding.pry
  #   redirect_to emails_path
  # end
  #
  # private
  #
  # def connect
  #   @gmail = Gmail.connect!(ENV['GMAIL_USERNAME'], ENV['GMAIL_PASSWORD']).inbox.emails()
  # end
end
