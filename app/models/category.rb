class Category < ApplicationRecord
  validates :name, :presence => true

    # Many_to_many with users via transactions
  has_many :transactions
  belongs_to :user
end
