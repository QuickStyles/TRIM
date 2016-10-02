class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.float :rate
      t.boolean :certified
      t.string :location
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
