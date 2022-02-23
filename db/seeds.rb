# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database of techers..."
User.destroy_all
Teacher.destroy_all

puts 'Creating 40 fake Teachers...'
user1 = User.new(
  email: 'test@test.com',
  password: '123456',
  name: 'Karl'
)

file = URI.open('app/assets/images/users/1.jpg')
user1.photo.attach(io: file, filename: '1.jpg', content_type: 'image/jpg')

user1.save!

40.times do
  teacher = Teacher.new(
    name:    Faker::Superhero.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: Faker::Quote.matz,
    price: rand(20..50),
    rating: rand(0..5)
  )
  teacher.user = user1
  teacher.save!
end
puts 'Finished!'
