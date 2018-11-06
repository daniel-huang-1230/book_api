FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    publisher_id nil
  end
end
