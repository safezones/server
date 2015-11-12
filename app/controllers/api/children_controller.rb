module Api
	class ChildrenController < ApiController
		def index
			children = Child.all
			unless params[:adult_id].nil?
				children = children.joins(:adults).where("adults.id" => params[:adult_id])
			end
			render json: children
		end

		def update
			if child = Child.find_by_id(params[:id])
				attributes = ActiveSupport::JSON.decode(params.except(:id))
				if child.update_attributes(attributes)
					render json: [child]
				else
					render json: error("Couldn't update user")
				end
			else
				render json: "No child with such id was found"
			end
		end

		def show
			if child = Child.find_by_id(params[:id])
				render json: [child]
			else
				render json: error("Couln't find such child")
			end
		end

	end
end