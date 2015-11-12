class ZoneCategory < ActiveRecord::Base
	belongs_to :child
	has_many :safe_zones
end
