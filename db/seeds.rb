# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."

DojoSpace.destroy_all

puts "Creating Dojo Spaces..."

50.times do

    dojo_space = DojoSpace.create(
        name: "#{Faker::Name.first_name}'s Dojo Space",
        price: [35, 50, 75].sample,
        location: "#{Faker::Address.city}",
        martial_art: ["Karate", "Jujiutsu", "Judo"].sample,
        user_id: [1].sample
    )

    puts "Created #{dojo_space.name}"

end

puts "Finished!"
