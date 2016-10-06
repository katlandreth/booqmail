class ContactMessagesController < ApplicationController
   respond_to :html, :js

  def new
    @message = ContactMessage.new
    @os = OperatingSystem.all
    @os_versions = OsVersion.where("operating_system_id = ?", OperatingSystem.first.id)
    @gimp_versions = GimpVersion.all
  end

  def create
    @os = OperatingSystem.all
    @os_versions = OsVersion.where("operating_system_id = ?", OperatingSystem.first.id)
    @gimp_versions =GimpVersion.all
    @message = ContactMessage.new(message_params)
    if verify_recaptcha() && @message.valid?
      binding.pry
      Mailer.contact_me(@message).deliver_now
      redirect_to new_contact_message_path, notice: "Your message has been sent"
    else
      render :new
    end
  end

  def update_os_versions
    if params[:operating_system_id].presence
      @os_name = OperatingSystem.find(params[:operating_system_id]).name
      @os_versions = OsVersion.where("operating_system_id = ?", params[:operating_system_id])
      respond_to do |f|
        f.js
      end
    else
      @os_name = "os"
      @os_versions = OsVersion.new
      render update_os_versions_path
    end
  end

  private
  def message_params
    params.require(:contact_message).permit(:email, :content, :image, :name, :gimp_version, :os_version, :subject, :operating_system_id, :os_version_id)
  end
end
