class Category < ApplicationRecord
  validates :name, :presence => true

    # Many_to_many with users via transactions
  has_many :transactions
  has_many :goals
  belongs_to :user
end
