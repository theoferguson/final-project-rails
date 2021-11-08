class User < ApplicationRecord
    has_secure_password

    has_many :offerings

    validates :username, presence: true
    validates :username, uniqueness: true
end
