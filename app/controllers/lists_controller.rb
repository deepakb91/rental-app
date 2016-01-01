class ListsController < ApplicationController
	before_filter :load_list, :only=>[:edit, :update, :destroy, :view]
	before_filter :require_user, :only=>[:new]
	def new
		@list=List.new
	end

	def create
		@list = List.new(params[:list])
		if @list.save
			flash[:success] = "Your space is now available to others"
			redirect_to my_space_path
		else
			render 'new' 
		end
	end
	def update
		if @list.update_attributes(params[:list])
			flash[:success]="Your space is successfully updated"
			redirect_to my_space_path
		end
	end
	def destroy
    	if@list.destroy
    		flash[:success]="Space Removed"
    		redirect_to my_space_path
    	end
	end

	def find
		@lists=List.search_result(params[:country])
		unless require_user
		end
		if @lists.empty?
			flash[:error]="No results found..Try searching for another place"
			redirect_to users_path
		end
	end

	def my_space
		@lists=current_user.lists
		if @lists.empty?
			flash[:error]="Your space is empty. List your property now."
			redirect_to list_myspace_path
		end
	end

	def my_plan
		@visits=current_user.visits
		if@visits.empty?
			flash[:error]="You haven't planned any visits"
			redirect_to users_path
		end
	end


	def load_list
		@list=List.find(params[:id])
	end
end
