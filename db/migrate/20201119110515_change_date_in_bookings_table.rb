class ChangeDateInBookingsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :start_time, :datetime
    remove_column :bookings, :end_time, :datetime
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
