class EmailsController < ApplicationController
  def index
    @messages = GmailInbox.new().inbox
  end

  def show
     @message = GmailMessage.new(params[:id])
  end
end
