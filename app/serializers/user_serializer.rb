class UserSerializer < ActiveModel::Serializer
  attributes :id, :username,:password_digest, :name, :email, :picture, :company, :capacity_provider, :location, :industry

  has_many :offerings
  has_many :posts, through: :offerings
end
