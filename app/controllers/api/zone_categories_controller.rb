module Api
	class ZoneCategoriesController < ApiController
		def index
			category = ZoneCategory.all
			unless params[:child_id].nil?
				category = category.where(child_id: params[:child_id])
			end
			render json: category
		end

		def create
			category = ZoneCategory.new(request.POST)
			if category.save
				render json: [category]
			else
				render json: error("Category could not be created")
			end
		end
	end
end