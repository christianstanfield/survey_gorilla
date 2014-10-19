class Answer < ActiveRecord::Base

	belongs_to :choice
	belongs_to :taken_survey

end
