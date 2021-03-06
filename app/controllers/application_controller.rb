require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "heyy"
  end

  get "/" do
    erb :welcome
  end

  def logged_in?
    !!session[:user_id]
  end 
  
  def current_user
    User.find_by_id(session[:user_id])
  end 
  
  # def require_login
  #   unless logged_in?
  #     redirect "/users/login"
  #   end 
  # end 

end
