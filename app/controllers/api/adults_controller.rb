module Api
	class AdultsController < ApiController
		def index
			adult = Adult.all
			unless params[:child_id].nil?
				adult = adult.joins(:children).where("children.id" => params[:child_id])
			end
			render json: adult
		end

		def update
			if adult = Adult.find_by_id(params[:id])
				if parent.update_attributes(request.POST.except(:id))
					render json: [adult]
				else
					render json: error("Couldn't update parent")
				end
			else
				render json: "No parent with such id was found"
			end
		end

		def show
			if adult = Adult.find_by_id(params[:id])
				render json: [adult]
			else
				render json: error("Couln't find such parent")
			end
		end

		def create
			adult = Adult.new
			if adult.update(request.POST)
				render json: [adult]
			else
				render json: error("Adult could not be created")
			end
		end

	end
end