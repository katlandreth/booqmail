class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      Mailer.contact_me(@message).deliver_now
      redirect_to new_message_path, notice: "Your message has been sent"
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:email, :content, :image, :name, :gimp_version, :os_version)
  end
end
