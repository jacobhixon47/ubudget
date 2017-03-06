class Goal < ApplicationRecord
  validates :base_amount, :spent_amount, :category_id, :presence => true

  # Join table for categories_usersåß
  belongs_to :category
end
