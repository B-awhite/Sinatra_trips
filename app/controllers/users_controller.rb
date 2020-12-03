class UsersController < ApplicationController 

    get '/signup' do 
        erb :"/users/signup"
      end 
      
      post '/signup' do 
         user = User.create(params)
         if user.save
            session[:user_id] = user.id
            redirect "/trips"
         else
             @error = "Can't be blank"
             erb :"/users/signup"
         end
      end

end 