class TripsController < ApplicationController

    before do 
      require_login 
    end 

  get '/trips' do 
    @user = current_user
     @trips = current_user.trips
      erb :"/trips/index"
  end 

  get '/trips/new' do 
    erb :"/trips/new"
  end

  post '/trips' do 
    trip = current_user.trips.create(params[:trip])
    redirect "/trips/#{trip.id}"
  end

  get '/trips/:id' do 
    search_for_trip
    if @trip
      erb :"trips/show"
    else
      redirect "/trips"
    end 
  end 

  get '/trips/:id/edit' do 
    search_for_trip
    erb :"/trips/edit"
  end

  patch '/trips/:id' do 
    search_for_trip
    @trip.update(params[:trip])
    redirect "/trips/#{trip.id}"
  end 

  delete '/trips/:id' do 
    search_for_trip
    @trip.destroy
    redirect "/trips"
  end

  private 
  
  def search_for_trip
    @trip = Trip.find_by(id:params[:id])
  end 
  

end 
