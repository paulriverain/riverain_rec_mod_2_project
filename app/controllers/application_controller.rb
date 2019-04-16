class ApplicationController < ActionController::Base

  def likes
    session[:likes] ||=[]
  end


  def add_to_trips(trip_id)
  	likes << trip_id
  end

  def show_the_likes
     @liked_trips = likes
  end

end
