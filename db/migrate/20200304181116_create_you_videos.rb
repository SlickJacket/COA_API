class CreateYouVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :you_videos do |t|
      t.string :youtube_link
      t.string :title
      t.string :description
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
