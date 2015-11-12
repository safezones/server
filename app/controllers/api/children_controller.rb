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
				if child.update_attributes(request.POST.except(:id))
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

		def create
			child = Child.new(request.POST)
			if child.save
				render json: [child]
			else
				render json: error("Child could not be created")
			end
		end

	end
end