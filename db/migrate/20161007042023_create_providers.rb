class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
