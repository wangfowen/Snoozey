class AddShamePointsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :shame_points, :integer
  end
end
