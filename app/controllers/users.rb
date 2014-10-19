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

  redirect '/users'
end

##### Specific User #####

get '/users/:user_id' do

  erb :'users/show'
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

##### Login #####

get '/login' do 

	erb :"/users/login"
end

post '/login' do 
	# @user = User.find_by(email: params[:user][:email])
	@user = User.authenticate(params[:user][:email], params[:user][:password])
	if @user != nil
		session[:user_id] = @user.id 
	end
	
	redirect '/users'
end

##### Logout #####

get '/logout' do

	session.clear
	erb :index
end
