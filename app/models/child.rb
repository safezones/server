class Child < ActiveRecord::Base
	has_many :adults, through: :adult_children
	has_many :adult_children

	has_many :zone_categories
	has_many :safe_zones, through: :zone_categories

	before_update :update_safe_zone

	def update_safe_zone
		if self.last_lat_changed? or self.last_lon_changed?
			for safe_zone in self.safe_zones
				if Geocoder::Calculations.distance_between([safe_zone.lat,safe_zone.lon], [self.last_lat,self.last_lon]) < safe_zone.radius
					update_column :safe_zone, safe_zone.id
					return
				end
			end

			update_column :safe_zone, -1
		end
	end
end
