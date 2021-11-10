class User < ApplicationRecord
    has_secure_password

    has_many :offerings
    has_many :posts, through: :offerings

    validates :username, presence: true
    validates :username, uniqueness: true
end
