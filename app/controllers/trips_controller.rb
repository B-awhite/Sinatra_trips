class TripsController < ApplicationController

  # before do 
  #   require_login 
  # end

  get '/trips' do 
    @user = current_user
    if logged_in? && @user
    # binding.pry
    # @user = current_user
     @trips = current_user.trips
      erb :"/trips/index"
    else 
      redirect "/login"
    end 
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
    if @trip && authorized?
      erb :"/trips/show"
    else
      redirect "/trips"
    end 
  end 

  get '/trips/:id/edit' do 
    search_for_trip
    if @trip && authorized?
      erb :"/trips/edit"
    else
      redirect "/trips"
    end 
  end

  patch '/trips/:id' do 
    search_for_trip
    if @trip && authorized?
     @trip.update(params[:trip])
     redirect "/trips/#{@trip.id}"
    else 
      @error = "You cant do that"
      redirect "/trips/:id/edit"
    end 
  end 

  delete '/trips/:id' do 
    search_for_trip
    if @trip && authorized?
     @trip.destroy
     redirect "/trips"
    else 
      redirect "/trips"
    end 
  end

  private 
  
  def search_for_trip
    @trip = Trip.find_by(id:params[:id])
  end 

  def authorized? 
    if @trip.user.id == current_user.id
      true
    else 
      false
    end 
  end 
  

end 
