class ChangeTransactionDatetimeToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :transactions, :date, :date
  end
end
