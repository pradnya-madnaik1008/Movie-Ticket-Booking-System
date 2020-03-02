class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :movie_id
      t.string :timeslot

      t.timestamps
    end
  end
end
