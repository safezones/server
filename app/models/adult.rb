class Adult < ActiveRecord::Base
	has_many :children, through: :adult_children
	has_many :adult_children
end
