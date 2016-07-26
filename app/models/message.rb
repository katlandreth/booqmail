class Message
  include ActiveModel::Model
  attr_accessor :email, :content, :image

  validates :email, :content, presence: true
end
