module Api
	class CategoriesController < ApiController
		def index
			category = Category.all
			unless params[:child_id].nil?
				category = category.where(child_id: params[:child_id])
			end
			render json: category
		end
	end
end