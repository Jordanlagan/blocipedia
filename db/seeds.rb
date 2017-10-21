

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!( id: 1, email: "test@fakexx9398402fas.com", password: "helloworld" )

5.times do |t|
  Wiki.create!( id: t, title: "Sample Wiki #{t+1}", body: "sample text", private: false, user: user )
end

puts "Wikis seeded"
