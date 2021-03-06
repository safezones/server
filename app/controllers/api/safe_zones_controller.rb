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
				if safe_zone.update_attributes(request.POST.except(:id).compact)
					render json: [safe_zone]
				else
					render json: error("Couldn't update safe_zone")
				end
			else
				render json: "No safe_zone with such id was found"
			end
		end

		def create
			safe_zone = SafeZone.new(request.POST.compact)
			if safe_zone.zone_category.nil?
				render json: error("zone category not sent!")
			else
				
				safe_zone.lat, safe_zone.lon = safe_zone.zone_category.child.last_lat, safe_zone.zone_category.child.last_lon

				if safe_zone.save
					render json: [safe_zone]
				else
					render json: error(safe_zone.errors.full_messages.join(", "))
				end
			end
		end
	end
end
