class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.column :description, :string
      t.column :amount, :float
      t.column :income, :boolean
      t.column :category_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
