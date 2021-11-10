class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :offering
  has_one :offering
end
