require 'faker'
# transaction_list = [
#   [ "dinner", 12.50, false, 1, 1 ],
#   [ "lunch", 20.25, false, 1, 1 ],
#   [ "drinks", 10.75, false, 3, 1 ]
# ]
#
# transaction_list.each do |description, amount, income, category_id, user_id|
#   Transaction.create( description: description, amount: amount, income: income, category_id: category_id, user_id: user_id )
# # end
#
User.all.each do |user|
  750.times do
    user.transactions.create(amount: rand(0..30), description: Faker::StarWars.quote, date: Faker::Date.between(1.year.ago, Date.today), category_id: rand(user.categories.first.id..user.categories.last.id))
  end
  50.times do
    user.transactions.create(amount: rand(30..100), description: Faker::StarWars.quote, date: Faker::Date.between(1.year.ago, Date.today), category_id: rand(user.categories.first.id..user.categories.last.id))
  end
  10.times do
    user.transactions.create(amount: rand(100..750), description: Faker::StarWars.quote, date: Faker::Date.between(1.year.ago, Date.today), category_id: rand(user.categories.first.id..user.categories.last.id))
  end
end
