class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.string :time_start
      t.string :time_end

      t.timestamps
    end
  end
end
