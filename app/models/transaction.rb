class Transaction < ApplicationRecord
  validates :description, :amount, :category_id, :user_id, :presence => true

  # Join table for categories_usersåß
  belongs_to :user
  belongs_to :category
end
