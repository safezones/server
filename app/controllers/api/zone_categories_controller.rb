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
			category = ZoneCategory.new(request.POST.compact)
			if category.save
				render json: [category]
			else
				render json: error("Category could not be created")
			end
		end

		def update
			if category = ZoneCategory.find_by_id(params[:id])
				if category.update_attributes(request.POST.except(:id))
					render json: [category]
				else
					render json: error("Couldn't update category")
				end
			else
				render json: "No category with such id was found"
			end
		end

		def create
			category = ZoneCategory.new(request.POST.compact)
			if category.save
				render json: [category]
			else
				render json: error("category could not be created")
			end
		end
	end
end