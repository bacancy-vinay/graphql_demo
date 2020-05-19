# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, age: Faker::Number.within(range: 1..100))
  5.times do
    user.posts.create(title: Faker::Lorem.sentence(word_count:3), body: Faker::Lorem.sentence(word_count:5))
  end
  puts 'user post created'
end
puts 'user created'
