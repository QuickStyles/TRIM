class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.timestamptz :time_start
      t.timestamptz :time_end
      t.references :person, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
