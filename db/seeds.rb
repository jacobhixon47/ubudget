# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

transaction_list = [
  [ "dinner", 12.50, false, 1, 1 ],
  [ "lunch", 20.25, false, 1, 1 ],
  [ "drinks", 10.75, false, 3, 1 ]
]

transaction_list.each do |description, amount, income, category_id, user_id|
  Transaction.create( description: description, amount: amount, income: income, category_id: category_id, user_id: user_id )
end
