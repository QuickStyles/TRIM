class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :gender
      t.string :password_digest
      t.string :type

      t.timestamps
    end
    add_index :users, :email
  end
end
