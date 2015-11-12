module Api
	class SafeZonesController < ApiController
		def index
			safe_zones = SafeZone.all
			unless params[:zone_category_id].nil?
				safe_zones = safe_zones.where("zone_category_id" => params[:zone_category_id])
			end

			unless params[:child_id].nil?
				safe_zones = safe_zones.joins(:zone_category).where("zone_categories.id" => params[:child_id])
			end

			render json: safe_zones
		end

		def show
			if safe_zone = SafeZone.find_by_id(params[:id])
				render json: [safe_zone]
			else
				render json: error("Couln't find such safe zone")
			end
		end

		def update
			if safe_zone = SafeZone.find_by_id(params[:id])
				if safe_zone.update_attributes(request.POST.except(:id))
					render json: [safe_zone]
				else
					render json: error("Couldn't update safe_zone")
				end
			else
				render json: "No safe_zone with such id was found"
			end
		end

		def create
			safe_zone = SafeZone.new(request.POST)
			if safe_zone.save
				render json: [safe_zone]
			else
				render json: error("safe_zone could not be created")
			end
		end
	end
end
