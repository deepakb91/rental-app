module ListsHelper
	def get_data
		@lists=List.find(params[:country])
	end
end
