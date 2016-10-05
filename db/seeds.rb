# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all

User.delete_all
40.times do
  name = Faker::Name.name
  User.create(fullname: name,
              contact: Faker::Internet.email(name),
              bio: Faker::Hacker.say_something_smart,

              )
end

puts "created 40 users"
