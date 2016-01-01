class VisitsController < ApplicationController
	before_filter :load_visit, :only=>[:destroy]
	before_filter :load_list,  :only=>[:new, :show, :view]
	def new
		@visit = Visit.new 
	end

	def create
		@visit = Visit.new(params[:visit])
		if @visit.save
			flash[:success]="Booking successfull"
     		redirect_to my_plan_path
		else
			render 'new' 
		end
	end

	def check_room
		@rooms = Visit.find_all_by_list_id(params[:id], :conditions=>["datein <= ? AND dateout >= ?", params[:selected_value],params[:selected_value]]).map(&:guests).sum
	end

	def get_max_guests
		render :text => check_room.to_s, :status => 200
	end

	def destroy
    	@visit.destroy
    	flash[:success]="Plan cancelled"
    	redirect_to my_plan_path
	end

	def get_dateout
		@dateout=Visit.minimum(:datein, :conditions=>["list_id = ? AND datein > ? AND place = ?", params[:id], params[:date_in],params[:place]])
		if@dateout.nil?

		else
			render :text => @dateout.to_s, :status => 200
		end
	end

	def load_visit
		@visit = Visit.find(params[:id])
	end

	def load_list
		@list=List.find(params[:id])
	end
end
