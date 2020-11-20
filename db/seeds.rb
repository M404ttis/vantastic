# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'

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

pic_ids = ["https://images.unsplash.com/photo-1527786356703-4b100091cd2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80", "https://images.unsplash.com/photo-1502113040754-9e3e85618a00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1520101244246-293f77ffc39e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80", "https://images.unsplash.com/photo-1531247370505-ce9e32a056a7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80", "https://images.unsplash.com/photo-1489307229055-9d55422662bd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80", "https://images.unsplash.com/photo-1592639297419-e539eb5d6d13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"]
pic_ids.each do |pic|
  faker_brand = Faker::Vehicle.make
  filepath = Rails.root.join('db', 'german_cities.csv')
  csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
  cities = CSV.foreach(filepath, csv_options) do |row|
    puts "#{row['city']}"
    end
  Van.create!(
    title: Faker::Book.title,
    brand: faker_brand,
    model: Faker::Vehicle.model(make_of_model: faker_brand),
    description: Faker::Lorem.paragraphs(number: 1),
    location: cities,
    price_per_day: rand(20..1000),
    user: User.all.sample,
    photo_url: pic,
    )
end

puts "End seeding van, #{Van.count} created ..."
