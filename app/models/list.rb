class List < ActiveRecord::Base
	belongs_to :user
	has_many :visits
	named_scope :search_result, lambda{ |country|
		{:conditions=>["country = ?", "#{country}"]}
	}
end