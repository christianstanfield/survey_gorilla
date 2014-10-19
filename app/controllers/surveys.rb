post '/' do

	# request.body.rewind
	SurveyParser.new.parse(request.body.read)
	# hard_coded_json = request.body.read.split("&").to_json
	# request_payload = JSON.parse(hard_coded_json)
	# a = request_payload
	# puts a[0]
end