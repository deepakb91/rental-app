class User < ActiveRecord::Base
	acts_as_authentic do |c|	
	end
	has_many :lists
	has_many :visits , :foreign_key => "guest_id"
end