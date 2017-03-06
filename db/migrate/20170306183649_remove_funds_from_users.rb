class RemoveFundsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :funds
  end
end
