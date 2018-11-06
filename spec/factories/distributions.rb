FactoryBot.define do
  factory :distribution do
    book_id nil
    shop_id nil
    copies_in_stock {Faker::Number.between(1, 20)}
  end
end
