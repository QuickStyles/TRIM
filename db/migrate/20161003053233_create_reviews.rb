class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :body
      t.references :booking, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
