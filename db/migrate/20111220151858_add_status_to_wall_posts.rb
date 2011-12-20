class AddStatusToWallPosts < ActiveRecord::Migration
  def change
  	add_column :wall_posts, :status, :integer, :default => '0'
  end
end
