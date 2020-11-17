# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Van.destroy_all
User.destroy_all

puts "Start seeding user..."

10.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  username: Faker::Internet.username(specifier: 3..15),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
    )
end

puts "End seeding user, #{User.count} created ..."

puts "Start seeding van..."

10.times do
  faker_brand = Faker::Vehicle.make
  Van.create!(
    title: Faker::Marketing.buzzwords,
    brand: faker_brand,
    model: Faker::Vehicle.model(make_of_model: faker_brand),
    description: Faker::Lorem.paragraphs(number: 1),
    location: ["Berlin", "Essen", "München", "Hamburg", "Düsseldorf", "Freiburg", "Leipzig", "Frankfurt" ].sample,
    photo: Faker::LoremFlickr.image(size: "50x60", search_terms: [faker_brand]),
    price_per_day: rand(20..1000),
    user: User.last
    )
end

puts "End seeding van, #{Van.count} created ..."
