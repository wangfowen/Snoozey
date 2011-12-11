class UpdateMigrations < ActiveRecord::Migration
  def change
  	remove_column :users, :shame_points
  	add_column :users, :shame_points, :integer, :default => '0'
  end
end
