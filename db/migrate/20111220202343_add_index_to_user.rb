class AddIndexToUser < ActiveRecord::Migration
  def change
  	remove_index :users, :email
  	add_index :users, :user_id, :unique => true
  end
end
