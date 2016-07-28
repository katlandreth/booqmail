class Message
  include ActiveModel::Model
  attr_accessor :email, :content, :image, :name, :os_version, :gimp_version

  validates :email, :content, :os_version, :gimp_version, presence: true
end
