# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

puts "Start seeding user..."

100.times do
  User.create!(
  username: Faker::Name.name,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
    )
end

puts "End seeding user, #{User.count} created ..."

puts "Start seeding van..."

30.times do
  faker_brand = Faker::Vehicle.make
  Van.create!(
    title: Faker::Marketing.buzzwords,
    brand: faker_brand,
    model: Faker::Vehicle.model(make_of_model: faker_brand),
    description: Faker::Lorem.paragraphs(number: 1),
    photo: Faker::LoremFlickr.image(size: "50x60", search_terms: [faker_brand]),
    price_per_day: rand(20..1000),
    user: User.all.sample
    )
end

puts "End seeding van, #{Van.count} created ..."
