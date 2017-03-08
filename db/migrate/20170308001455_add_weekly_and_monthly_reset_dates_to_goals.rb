class AddWeeklyAndMonthlyResetDatesToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :weekly_reset, :datetime
    add_column :goals, :monthly_reset, :datetime
  end
end
