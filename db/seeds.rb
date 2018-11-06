# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  Publisher.create!()
end

10.times do
  book = Book.create!(
    :title => Faker::Book.title, # random book title
  )
  publisher_id = rand(1..3)
  book.publisher_id = publisher_id
  book.save
end

Shop.create!({
  :name => 'Amazon',
  :books_sold_count => 10
  })

Shop.create!({
  :name => 'Barnes and Noble',
  :books_sold_count => 5
  })

Shop.create!({
  :name => 'Good Will Bookstore',
  :books_sold_count => 3
  })
