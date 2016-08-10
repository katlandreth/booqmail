class EmailsController < ApplicationController
  def index
    @messages = GmailInbox.new().inbox
  end

  def show
    @message = GmailMessage.new(params[:id])
  end

  def new_reply
    @message = GmailMessage.new(params[:id])
  end

  def create_reply
    @message = GmailMessage.new(reply_params[:id]).email
    if GmailMessage.new().reply(reply_params)
      redirect_to email_path(reply_params[:id])
    else
      render 'new_reply'
    end
  end

  private
  def reply_params
    params.require(:email).permit(:send_to, :message_body, :message_attachment, :id, :subject)
  end
end
