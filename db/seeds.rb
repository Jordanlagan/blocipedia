

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = [:standard, :premium]

user = User.create!( id: 0, email: "test@example.com", password: "helloworld", role: :admin )

5.times do |t|
  User.create!( id: t+1, email: "user#{t+1}@example.com", password: "helloworld" )
end
users = User.all

20.times do |t|
  Wiki.create!( id: t, title: "Sample Wiki #{t+1}", body: "sample text", private: false, user: users.sample )
end

puts "Users seeded"
puts "Wikis seeded"
