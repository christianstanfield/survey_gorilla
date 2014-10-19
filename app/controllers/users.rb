##### List Users #####

get '/users' do

  erb :'users/index'
end

##### New User #####

get '/users/new' do

  erb :'users/new'
end

post '/users' do
	@user = User.create!(params[:user])
	@user.password=(params[:password])
	session[:user_id] = @user.id
	@user.save
	
  redirect '/users'
end

##### Login #####

get '/users/login' do 

	erb :"/users/login"
end

post '/users/login' do 
	# @user = User.find_by(email: params[:user][:email])
	@user = User.authenticate(params[:user][:email], params[:user][:password])
	if @user != nil
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		redirect '/users/login'
	end
end

##### Specific User #####

get '/users/:user_id' do
	if session[:user_id] != nil
		@user = User.find(session[:user_id])
	  erb :'users/show'
	else
		redirect '/users/login'
	end
end

##### Edit User #####

get '/users/:user_id/edit' do

  erb :'users/edit'
end

put '/users/:user_id' do

	redirect '/users/:user_id'
end

##### Delete User #####

delete '/users/:user_id' do

	redirect '/users' 
end

##### Logout #####

get '/logout' do

	session.clear
	erb :index
end
