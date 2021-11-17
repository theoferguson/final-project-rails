class User < ApplicationRecord
    has_secure_password

    has_many :offerings
    has_many :posts, through: :offerings

    has_many :messages
    has_many :sender_messages, class_name: 'Message', foreign_key: 'sender_id'

    validates :username, presence: true
    validates :username, uniqueness: true
end
