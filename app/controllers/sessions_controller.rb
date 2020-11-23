class SessionsController < ApplicationController 

  get '/login' do 
    erb :"/session/login"
  end 

  post '/login' do 
    user = User.find_by(username: params[:username])
     if  params[:username].empty? || params[:password].empty?
         @error = "Username and password must be filled"
         erb :"/session/login"
     else     
         if user && user.authenticate(params[:password])
           session[:user_id] = user.id 
           redirect "/trips"
         else 
            @error = "User not found"
            erb :"/session/login"
         end 
    end 
 end  
   
  delete "/logout" do 
    session.clear
    redirect "/"
  end 

end 