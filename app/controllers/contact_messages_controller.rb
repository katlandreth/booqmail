class ContactMessagesController < ApplicationController
   respond_to :html, :js

  def new
    @message = ContactMessage.new
    @os = OperatingSystem.all
    @os_versions = OsVersion.where("operating_system_id = ?", OperatingSystem.first.id)
  end

  def create
    @message = ContactMessage.new(message_params)
    if verify_recaptcha() && @message.valid?
      Mailer.contact_me(@message).deliver_now
      redirect_to new_contact_message_path, notice: "Your message has been sent"
    else
      render :new
    end
  end

  def update_os_versions
    @os_versions = OsVersion.where("operating_system_id = ?", params[:operating_system_id])
    respond_to do |f|
      f.js
    end
  end

  private
  def message_params
    params.require(:contact_message).permit(:email, :content, :image, :name, :gimp_version, :os_version, :subject, :operating_system_id, :os_version_id)
  end
end
