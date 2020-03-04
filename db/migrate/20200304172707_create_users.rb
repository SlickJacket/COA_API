class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :bio
      t.string :profile_img
      t.string :cover_img
      t.boolean :admin

      t.timestamps
    end
  end
end
