class BookingsController < ApplicationController
  def index
  	@booking = Booking.new
  	@movie = Movie.find_by_id(params[:movie_id])
  end

  def create
  	booking_hash = params["booking"]
  	booking = Booking.create(movie_id: booking_hash["movie_id"], timeslot: booking_hash["timeslot"])
  	respond_to do |format|
      if booking.save
      	create_seats booking, booking_hash
        format.html { redirect_to bookings_invoice_path(booking.id), notice: 'Booking was successfully created.' }
      end
    end
  end

  def create_seats booking, booking_hash
  	booking_hash["selected_seats"].each do |k, v|
  		v.each do |seat_no|
  			Seat.create(booking_id: booking.id, seat_no: seat_no, price: k.to_i)
  		end
  	end
  end

  def show_booked_seats
  	@booked_seats = Booking.joins('RIGHT JOIN seats ON seats.booking_id = bookings.id').select("seats.price, seats.seat_no").where(timeslot: params['timeslot'], movie_id: params['movie_id'])
  	if request.xhr?
  	end
  end

  def invoice
  end
end
