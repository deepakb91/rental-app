class CreateSpace < ActiveRecord::Migration
  def self.up
  	create_table :lists do|t|
      t.string  :user_id
  		t.string  :room_type
  		t.string  :accomodates
  		t.integer :bedrooms
  		t.string  :title
  		t.string  :description
  		t.string  :mail
  		t.string  :phone
  		t.string  :address1
  		t.string  :address2
  		t.string  :city
  		t.string  :state
  		t.string  :country
  		t.string  :cost

  		t.timestamps
  	end
  end

  def self.down
  	drop_table :lists
  end
end
