class ContactMessage
  include ActiveModel::Model
  attr_accessor :email, :content, :image, :name, :os_version, :gimp_version, :subject

  validates :email, :content, :os_version, :gimp_version, presence: true
end
