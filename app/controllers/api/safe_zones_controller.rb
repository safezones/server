module Api
	class SafeZonesController < ApiController
		def index
			safe_zones = SafeZone.all
			unless params[:zone_category_id].nil?
				safe_zones = safe_zones.joins(:zone_categories).where("categories.id" => params[:zone_category_id])
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
	end
end
