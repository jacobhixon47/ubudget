class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.column :base_amount, :integer
      t.column :spent_amount, :float
      t.column :category_id, :integer
      t.column :weekly, :boolean

      t.timestamps
    end
  end
end
