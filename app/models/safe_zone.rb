class SafeZone < ActiveRecord::Base
	belongs_to :zone_category
	delegate :child, :to => :zone_category, :allow_nil => true
end
