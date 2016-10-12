class AddStripeTxnIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :stripe_txn_id, :string
  end
end
