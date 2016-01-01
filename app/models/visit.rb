class Visit < ActiveRecord::Base
	belongs_to :lists
	belongs_to :users, :foreign_key => "guest_id"
end