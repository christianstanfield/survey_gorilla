get '/' do
  if session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/users/login'
  end
end

