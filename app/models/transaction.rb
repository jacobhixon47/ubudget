class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :description, :category_id, :user_id, :amount, :income, :presence => true
end
