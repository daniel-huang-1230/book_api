FactoryBot.define do
  factory :shop do
    name { Faker::Company.name }
    books_sold_count {Faker::Number.between(1, 20)}
  end
end
