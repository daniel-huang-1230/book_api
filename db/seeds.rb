# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publishers = 3.times.map do
  Publisher.create!()
end

books = 10.times.map do
  Book.create!(
    :title => Faker::Book.title, # random book title
    publisher: publishers.sample,
  )
end

shops = 5.times.map do
  Shop.create!(
    :name => Faker::Company.name,
    :books_sold_count => Faker::Number.between(1, 20)
  )
end

5.times do
  Distribution.create!(
    :book => books.sample,
    :shop => shops.sample,
    :copies_in_stock => Faker::Number.between(1, 20)
  )
end
