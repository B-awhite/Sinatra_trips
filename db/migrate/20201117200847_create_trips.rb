class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t| 
      t.string :name 
      t.string :city
      t.string :image 
      t.integer :user_id
    end 
  end
end
