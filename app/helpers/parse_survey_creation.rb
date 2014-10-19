class SurveyParser
	def initialize
	end
	def parse(form_text)
		input_array = form_text.split("&")
		input_array.each do |pair|
			key = pair.split("=")[0]
			value = pair.split("=")[1]
			case key
			when 'title'
				@current_survey = CreatedSurvey.create!(title: value)
			when 'question'
				@current_question = Question.create!(content: value, created_survey_id: @current_survey.id)
			when 'choice'
				Choice.create!(option: value, question_id: @current_question.id)
			end
		end
	end
end
