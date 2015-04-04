class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :date
      t.string :title
      t.string :message
      t.string :video_url
      t.string :organization

      t.timestamps null: false
    end
  end
end
