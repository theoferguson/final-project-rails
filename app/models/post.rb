class Post < ApplicationRecord
  belongs_to :offering
  has_many :messages, dependent: :destroy
end
