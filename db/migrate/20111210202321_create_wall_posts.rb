class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.text :post
      t.integer :user_id 

      t.timestamps
    end
  end
end
