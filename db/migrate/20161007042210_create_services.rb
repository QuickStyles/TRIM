class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.float :rate
      t.boolean :certified
      t.string :location
      t.float :duration
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
