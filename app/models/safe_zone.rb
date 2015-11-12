class SafeZone < ActiveRecord::Base
	belongs_to :child
	belongs_to :zone_category
end
