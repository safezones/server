class Child < ActiveRecord::Base
	has_many :adults, through: :adult_children
	has_many :adult_children

	has_many :zone_categories
	has_many :safe_zones, through: :zone_categories

	before_update :update_safe_zone

	after_create :create_categories

	def update_safe_zone
		if self.last_lat_changed? or self.last_lon_changed?
			for safe_zone in self.safe_zones
				if Geocoder::Calculations.distance_between([safe_zone.lat,safe_zone.lon], [self.last_lat,self.last_lon]) < safe_zone.radius
					update_column :safe_zone, safe_zone.id
					return
				end
			end

			self.not_in_safe_zone
			update_column :safe_zone, -1
		end
	end

	private
		def not_in_safe_zone
			matrix = GoogleDistanceMatrix::Matrix.new
			lat_lng = GoogleDistanceMatrix::Place.new lng: 12, lat: 12
		end

		def create_categories
			# Create the default first 3 categories

			ZoneCategory.create(name: "Home", child: self)
			ZoneCategory.create(name: "Freinds", child: self)
			ZoneCategory.create(name: "Activities", child: self)

		end
end
