class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :description, :amount, :category_id, :user_id, :presence => true
end
