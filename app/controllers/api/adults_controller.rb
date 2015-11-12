module Api
	class AdultsController < ApiController
		def index
			adult = Adult.all
			unless params[:children_id].nil?
				adult = adult.joins(:children).where("children.id" => params[:children_id])
			end
			render json: adult
		end

		def update
			if adult = Adult.find_by_id(params[:id])
				attributes = ActiveSupport::JSON.decode(params.except(:id))
				if parent.update_attributes(attributes)
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
	end
end