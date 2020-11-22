class TripsController < ApplicationController

  get '/trips' do 
    @trips = Trip.all
    erb :'trips/index'
  end 

  get '/trips/:id' do 
    @trip = Trip.find_by(id:params[:id])
    erb :'trips/show'
  end 

end 
