class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :name, :email, :picture, :company, :capacity_provider, :location, :industry

  has_many :offerings
  has_many :posts, through: :offerings
  has_many :messages
  has_many :sender_messages, class_name: 'Message', foreign_key: 'sender_id'

end
