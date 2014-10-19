post '/surveys' do
	@user = User.find(session[:user_id])
	# request.body.rewind
	SurveyParser.new(@user).parse(request.body.read)
	# hard_coded_json = request.body.read.split("&").to_json
	# request_payload = JSON.parse(hard_coded_json)
	# a = request_payload
	# puts a[0]
	
	redirect "/users/#{@user.id}"
end

get '/surveys/:survey_id' do 
	@survey = params[:survey_id]

	erb :"surveys/show"
end