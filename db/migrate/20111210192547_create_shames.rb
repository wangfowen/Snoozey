class CreateShames < ActiveRecord::Migration
  def change
    create_table :shames do |t|

      t.timestamps
    end
  end
end
