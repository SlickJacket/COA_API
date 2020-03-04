class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.date :date
      t.string :content
      t.string :img
      t.string :you_link
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
