post '/surveys/new' do
  request_body = request.body.read
	# request.body.rewind
	SurveyParser.new(User.find(session[:user_id])).parse(request_body)
	# hard_coded_json = request.body.read.split("&").to_json
	# request_payload = JSON.parse(hard_coded_json)
	# a = request_payload
	# puts a[0]
end

get '/surveys/new' do
  erb :survey_create
end

get '/surveys/:survey_id/take' do
  @survey = CreatedSurvey.find(params[:survey_id])

  erb :take_survey
end

post '/surveys/:survey_id/take' do
  taken_survey = TakenSurvey.create!(user_id: session[:user_id], created_survey_id: params[:survey_id])
  params.values.each do |value|
    break if value=="Submit"
    Answer.create!(choice_id: value.to_i, taken_survey_id: taken_survey.id)
  end
  redirect '/'
end

get '/surveys/:survey_id/stats' do
  @survey = CreatedSurvey.find(params[:survey_id])
  if session[:user_id] == @survey.user.id
    @nsize = @survey.taken_surveys.size
    @nsize = 0 if @nsize.nil?
    erb :"surveys/show"
  else

    @message = "Get that shit outta here"
    erb :"surveys/show"
  end
end
