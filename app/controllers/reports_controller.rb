class ReportsController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def export_report
		require "csv" 
		file = "#{Rails.root}/report.csv" 
		bookings = Booking.joins('RIGHT JOIN seats ON seats.booking_id = bookings.id').select("seats.price, seats.seat_no, bookings.created_at, bookings.updated_at").where(timeslot: params['timeslot'], movie_id: params['movie_id'])
		movie = Movie.find params['movie_id']
		price, counter, seat_150, seat_200, seat_300 = 0, 0, 0, 0, 0
		CSV.open(file, "wb") do |row|
		  row << ["Movie Name", "Time Slot", "Seat No", "Seat Price", "Create Date", "Updated Date"]
		  bookings.each do |o|
		     row << [movie.name, params['timeslot'], o.seat_no, o.price, o.created_at, o.updated_at]
		     price = price + o.price
		     counter = counter + 1
		     if o.price.eql? 150
		     	seat_150 = seat_150 + 1
		     elsif o.price.eql? 200
		     	seat_200 = seat_200 + 1
		     else
		     	seat_300 = seat_300 + 1
		     end
		     		
		  end
		  row << []

		  row << ['Seats ', "Total Seats" , "Total Price", '', '', '']
		  row << ['Seats Booked for 150 ', seat_150 , 150*seat_150, '', '', '']
		  row << ['Seats Booked for 200 ', seat_200 , 200*seat_200, '', '', '']
		  row << ['Seats Booked for 300 ', seat_300 , 300*seat_300, '', '', '']
		  row << ['Total Seats Booked ', counter , '', '', '', '']
		  row << ['', 'Total Collection', price , '', '', '']
		end
		File.open(file, 'r') do |f|
		  send_data f.read, :type => "text/csv", :filename => "report.csv"
		end
	end
end