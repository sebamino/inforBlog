# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating categories...'

5.times do |i|
  Category.create(name: "Category #{i}")
end

puts 'Creating users...'

10.times do
  User.create(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    age: Faker::Number.between(from: 18, to: 65)
  )
end

puts 'Creating posts...'

50.times do
  Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    category_id: rand(1..5),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: rand(1..10)
  )
end
