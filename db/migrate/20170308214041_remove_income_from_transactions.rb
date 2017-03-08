class RemoveIncomeFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :income
  end
end
