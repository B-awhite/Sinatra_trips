class TripsController < ApplicationController

  get '/trips' do 
    @trips = Trip.all
    erb :'trips/index'
  end 

  get '/trips/new' do 
    erb :'/trips/new'
  end

  get '/trips/:id' do 
    @trip = Trip.find_by_id(params[:id])
    erb :'trips/show'
  end 

  post '/trips' do 
    trip = Trip.create(params[:trip])
    redirect "/trips/#{trip.id}"
  end

  get '/trips/:id/edit' do 
    @trip = Trip.find_by(id:params[:id])
    erb :"/trips/edit"
  end

  patch '/trips/:id' do 
    trip = Trip.find_by(id:params[:id])
    trip.update(params[:trip])
    redirect "/trips/#{trip.id}"
  end 

  delete '/trips/:id' do 
    trip = Trip.find_by(id:params[:id])
    trip.destroy
    redirect "/trips"
  end
  

end 
