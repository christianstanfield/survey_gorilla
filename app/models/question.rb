class Question < ActiveRecord::Base

	belongs_to :created_survey
	has_many :choices

end
