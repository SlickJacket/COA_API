class CreateInstaProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :insta_products do |t|
      t.string :photo_string
      t.string :title
      t.string :description
      t.string :material
      t.string :color
      t.string :length
      t.string :width
      t.string :stones
      t.string :cut
      t.string :stone_color
      t.string :carat_weight
      t.string :gram_weight
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
