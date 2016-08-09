class ContactMessagesController < ApplicationController
   respond_to :html, :js


  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new(message_params)
    if @message.valid?
      Mailer.contact_me(@message).deliver_now
      redirect_to new_contact_message_path, notice: "Your message has been sent"
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:contact_message).permit(:email, :content, :image, :name, :gimp_version, :os_version)
  end
end
