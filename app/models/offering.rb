class Offering < ApplicationRecord
    belongs_to :user
    has_one :post

    validates :name, presence: true
    validates :origin, presence: true
    validates :destination, presence: true
end
