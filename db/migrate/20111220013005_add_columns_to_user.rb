class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :access_token, :string
  	add_column :users, :name, :string
  	add_column :users, :picture, :string
  	add_column :users, :friends, :string
  	add_column :users, :user_id, :string
  end
end
