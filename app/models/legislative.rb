class Legislative < ActiveRecord::Base
	belongs_to :party
	belongs_to :district
	has_many :tweets
end
