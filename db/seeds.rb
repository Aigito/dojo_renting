# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."

User.destroy_all
DojoSpace.destroy_all

puts "Creating Users..."

4.times do
  user = User.create(
    first_name: "#{Faker::Name.first_name}",
    last_name: "#{Faker::Name.last_name}",
    email: "#{Faker::Internet.email}",
    password: "dojo123"
  )

  puts "Created User #{user.first_name} #{user.last_name}"
end

user = User.create(
  first_name: "David",
  last_name: "AJ Wong",
  email: "somethingwong@gmail.com",
  password: "123456"
)

puts "Creating Dojo Spaces..."
# file = URI.open("https://images.unsplash.com/photo-1530560643359-6d2fead989b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")

15.times do
  dojo_space = DojoSpace.create(
    name: "#{Faker::Name.first_name}'s Dojo Space",
    price: [35, 50, 75].sample,
    location: "#{Faker::Address.city}",
    martial_art: ["Karate", "Jujiutsu", "Judo"].sample,
    user_id: rand(1..5)
  )
  # dojo_space.photos.attach(io: file, filename: "dojo.jpeg", content_type: "image/jpg")
  puts "Created Space #{dojo_space.name}"
end

puts "Creating Bookings..."
5.times do
  booking = Booking.create(
    start_date: Date.strptime("02-12-2021", "%d-%m-%Y"),
    end_date: Date.strptime("15-1-2022", "%d-%m-%Y"),
    user_id: rand(1..4),
    accepted: [true, false, nil].sample,
    dojo_space_id: rand(1..15)
  )
  puts "Created Booking for #{DojoSpace.find(booking.dojo_space_id).name}"
  booking.save(validate: false)
end
5.times do
  booking = Booking.create(
    start_date: Date.strptime("01-01-2022", "%d-%m-%Y"),
    end_date: Date.strptime("02-02-2022", "%d-%m-%Y"),
    user_id: rand(1..4),
    accepted: [true, false, nil].sample,
    dojo_space_id: rand(1..15)
  )
  puts "Created Booking for #{DojoSpace.find(booking.dojo_space_id).name}"
  booking.save(validate: false)
end
5.times do
  booking = Booking.create(
    start_date: Date.strptime("01-01-2021", "%d-%m-%Y"),
    end_date: Date.strptime("02-02-2021", "%d-%m-%Y"),
    user_id: rand(1..4),
    accepted: [true, false, nil].sample,
    dojo_space_id: rand(1..15)
  )
  puts "Created Booking for #{DojoSpace.find(booking.dojo_space_id).name}"
  booking.save(validate: false)
end

puts "Creating Reviews..."
20.times do
  review = Review.create!(
    content: "#{Faker::Restaurant.review}",
    rating: rand(1..4),
    booking_id: rand(1..15)
  )
  puts "Created review for #{review.booking_id}"
end

puts "Finished!"
