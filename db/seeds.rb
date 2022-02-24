# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database of techers..."

Teacher.destroy_all
User.destroy_all

puts 'Creating 3 fake users...'

  user1 = User.new(
    email: "#{Faker::Creature::Dog.name}@dogs.com", #patches@dogs.com
    password: '123456',
    name: Faker::Creature::Dog.name
    )
  user1.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/1.png")), filename: "1")
  user1.save!

  user2 = User.new(
    email: "#{Faker::Creature::Dog.name}@dogs.com", #duke@dogs.com
    password: '123456',
    name: Faker::Creature::Dog.name
    )
  user2.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/2.png")), filename: "2")
  user2.save!

  user3 = User.new(
    email: "#{Faker::Creature::Dog.name}@dogs.com", #zoe@dogs.com
    password: '123456',
    name: Faker::Creature::Dog.name
    )
  user3.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/users/3.png")), filename: "3")
  user3.save!

puts "Finished creating users!"

# file = URI.open('app/assets/images/users/1.jpg')
# user1.photo.attach(io: file, filename: '1.jpg', content_type: 'image/jpg')

user1.save!

puts 'Creating 20 fake teachers...'
count2 = 0
20.times do
  if count2 <= 20
    count2 += 1
    teacher = Teacher.new(
      name:    Faker::Superhero.name,
      address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
      description: Faker::Quote.matz,
      price: rand(20..50),
      rating: rand(0..5)
    )
    teacher.photo.attach(io: File.open(File.join(Rails.root,"app/assets/images/teachers/#{count2}.png")), filename: "#{count2}")
    teacher.user = user1
    teacher.save!
    count2 += 1
  elsif count2 > 20
    count2 = 0
  end
end
puts 'Finished creating teachers!'
