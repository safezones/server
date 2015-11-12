class Child < ActiveRecord::Base
	has_many :adults, through: :adult_children
	has_many :adult_children

	has_many :zone_categories
	has_many :safe_zones, through: :zone_categories
end
