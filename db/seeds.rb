# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

recipes = []
15.times do
  recipes << Recipe.create(
    title: Faker::Lorem.words(rand(1..3)).join(" "), 
    body: Faker::Lorem.paragraph(rand(1..4))
  )
end

u = User.new(
  username: 'Member User',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save

puts "Seed finished"
puts "#{Recipe.count} recipes created"
puts "#{User.count} users created"