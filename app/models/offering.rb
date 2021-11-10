class Offering < ApplicationRecord
    belongs_to :user
    has_one :post
end
