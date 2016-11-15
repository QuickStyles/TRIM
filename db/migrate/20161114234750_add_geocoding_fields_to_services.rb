class AddGeocodingFieldsToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :address, :string
    add_column :services, :longitude, :float
    add_column :services, :latitude, :float
  end
end
