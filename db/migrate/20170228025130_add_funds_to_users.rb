class AddFundsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :funds, :float
  end
end
