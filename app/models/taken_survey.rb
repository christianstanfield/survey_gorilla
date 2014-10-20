class TakenSurvey < ActiveRecord::Base

	belongs_to :user
	belongs_to :created_survey
  has_many :answers

end
