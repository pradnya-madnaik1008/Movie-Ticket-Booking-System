module BookingsHelper
	def find_seats_by_booking_id booking_id
		Seat.where(:booking_id=> booking_id)
	end

	def find_booking_by_booking_id booking_id
		booking = Booking.find booking_id
		booking_time = booking.timeslot
		movie_name = booking.movie.name
		return booking_time, movie_name 
	end
end
