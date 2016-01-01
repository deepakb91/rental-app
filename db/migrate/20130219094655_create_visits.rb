class CreateVisits < ActiveRecord::Migration
  def self.up
  	create_table :visits do |t|
  	  t.string :list_id
      t.string :guest_id
      t.string :datein
      t.string :dateout
      t.string :guests
    end  
  end

  def self.down
  	drop_table :visits
  end
end
