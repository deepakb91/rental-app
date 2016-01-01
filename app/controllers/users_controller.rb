class UsersController < ApplicationController
	def new
		@user=User.new
		@title = "Sign up" 
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Signup successfull..You are now signed in"
     		redirect_to users_path
		else
      		@title = "Sign up"
			render 'new' 
		end
	end

	def show

	end
end
