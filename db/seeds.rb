require 'faker'
require 'seeding_methods'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = [:standard, :premium]

user = User.create!( email: "test@example.com", password: "helloworld", role: :admin, name: "Bob the Dinosaur" )

5.times do |t|
  User.create!( email: SeedingMethods.get_email, password: "helloworld", role: roles.sample, name: SeedingMethods.get_name )
end
users = User.all

25.times do |t|
  Wiki.create!( title: SeedingMethods.get_title, body: SeedingMethods.get_body, private: false, user: users.sample )
end

puts "Users seeded"
puts "Wikis seeded"
