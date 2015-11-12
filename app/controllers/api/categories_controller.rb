module Api
	class CategoriesController < ApiController
		def index
			category = Category.all
			unless params[:child_id].nil?
				category = category.where(child_id: params[:child_id])
			end
			render json: category
		end

		def create
			category = Category.new(request.POST)
			if category.save
				render json: [category]
			else
				render json: error("Category could not be created")
			end
		end
	end
end