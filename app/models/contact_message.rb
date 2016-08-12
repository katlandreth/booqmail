class ContactMessage
  include ActiveModel::Model
  attr_accessor :email, :content, :image, :name, :os_version, :gimp_version, :subject, :operating_system_id, :os_version_id

  validates :email, :content, :operating_system_id, :os_version_id, :gimp_version, presence: true
end
