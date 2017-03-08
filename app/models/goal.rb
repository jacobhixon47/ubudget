class Goal < ApplicationRecord
  validates :base_amount, :spent_amount, :category_id, :presence => true

  # Join table for categories_usersåß
  belongs_to :category

  def self.update_spending
    self.where(:weekly => true).each do |goal|
      if goal.weekly_reset != Date.today.beginning_of_week
        goal.update(weekly_reset: Date.today.beginning_of_week, spent_amount: 0)
      end
    end
    self.where(:weekly => false).each do |goal|
      if goal.monthly_reset != Date.today.beginning_of_month
        goal.update(monthly_reset: Date.today.beginning_of_month, spent_amount: 0)
      end
    end
  end

end
