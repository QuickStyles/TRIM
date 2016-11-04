class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.timestamp :time_start
      t.timestamp :time_end
      t.references :service, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
