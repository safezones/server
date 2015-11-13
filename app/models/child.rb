class Child < ActiveRecord::Base

	has_many :adults, through: :adult_children
	has_many :adult_children

	has_many :zone_categories
	has_many :safe_zones, through: :zone_categories

	before_update :update_safe_zone

	after_create :create_categories

	reverse_geocoded_by :last_lat, :last_lon, :address => :last_address
	after_validation :reverse_geocode

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

	def not_in_safe_zone

		pusher = Grocer.pusher(
		  certificate: "config/IOS_key.pem",      # required
		  passphrase:  "1234",                       # optional
		  gateway:     "gateway.push.apple.com", # optional; See note below.
		  port:        2195,                     # optional
		  retries:     3                         # optional
		)

		for adult in self.adults
			notification = Grocer::Notification.new(
			  device_token:      adult.destination_token,
			  alert:             self.name + " is not in a safe zone!",
			  badge:             1,
		      custom: {"child_id": self.id}
			)

			pusher.push(notification) # return value is the number of bytes sent successfully
		end
	end

	def create_categories
		# Create the default first 3 categories

		ZoneCategory.create(name: "Home", child: self)
		ZoneCategory.create(name: "Freinds", child: self)
		ZoneCategory.create(name: "Activities", child: self)

	end
end
