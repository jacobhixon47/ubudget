FactoryGirl.define do
  factory :transaction do
    description('gas')
    amount(30.00)
    income(false)
    category_id(1)
    user_id(1)
  end
end
