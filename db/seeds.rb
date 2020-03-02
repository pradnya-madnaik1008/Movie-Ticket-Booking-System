# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin user
User.create(email: "pradnya@gmail.com", password: 123456)

# Create movies
Movie.create([{ name: 'Star Wars', description: "star wars series"}, { name: 'Lord of the Rings' , description: "lord of rings popular series"}])

# Create booking
Booking.create(movie_id: 1, timeslot: "12-3")
Booking.create(movie_id: 1, timeslot: "4-7")
Booking.create(movie_id: 1, timeslot: "8-11")

# Create seats
Seat.create(booking_id: 1, seat_no: "1", price: 100)
Seat.create(booking_id: 1, seat_no: "2", price: 200)
Seat.create(booking_id: 2, seat_no: "3", price: 200)
Seat.create(booking_id: 2, seat_no: "4", price: 300)