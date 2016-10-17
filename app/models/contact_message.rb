class ContactMessage
  include ActiveModel::Model
  attr_accessor :email, :content, :image, :name, :os_version, :gimp_version, :subject, :operating_system_id, :os_version_id, :reason

  validates :email, :content, :reason, presence: true
  validates :operating_system_id, :os_version_id, :gimp_version, presence: true, if: :reason_is_gimp_help?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def reason_is_gimp_help?
    reason == 'gimp help'
  end
end
