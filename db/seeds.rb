# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def attach_photo(object, url)
  begin
    file = URI.open(url)
    object.photo.attach(io: file, filename: "photo", content_type: "image/jpg")
  rescue
    puts "uri fail"
  end
end

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

puts "Creating Dojo Spaces..."
# file = URI.open("https://images.unsplash.com/photo-1530560643359-6d2fead989b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")

50.times do
  dojo_space = DojoSpace.create(
    name: "#{Faker::Name.first_name}'s Dojo Space",
    price: [35, 50, 75].sample,
    location: "#{Faker::Address.city}",
    martial_art: ["Karate", "Jujiutsu", "Judo"].sample,
    user_id: rand(1..4)
  )
  # dojo_space.photos.attach(io: file, filename: "dojo.jpeg", content_type: "image/jpg")
  puts "Created Space #{dojo_space.name}"
end

puts "Creating Bookings..."
40.times do
  booking = Booking.create(
    start_date: Date.strptime("02-02-2022", "%d-%m-%Y"),
    end_date: Date.strptime("03-02-2022", "%d-%m-%Y"),
    user_id: rand(1..4),
    accepted: [true, false, nil].sample,
    dojo_space_id: rand(1..50)
  )
end
10.times do
  booking = Booking.create(
    start_date: Date.strptime("01-01-2021", "%d-%m-%Y"),
    end_date: Date.strptime("02-02-2021", "%d-%m-%Y"),
    user_id: rand(1..4),
    accepted: [true, false, nil].sample,
    dojo_space_id: rand(1..50)
  )
  puts "Created Booking for #{DojoSpace.find(booking.dojo_space_id).name}"
end

puts "Creating Reviews..."
50.times do
  review = Review.create!(
    content: "#{Faker::Restaurant.review}",
    rating: rand(1..4),
    booking_id: rand(1..50)
  )
  puts "Created review for #{review.booking_id}"
end

puts "Finished!"
