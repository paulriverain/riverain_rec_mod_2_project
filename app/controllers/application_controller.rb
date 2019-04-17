class ApplicationController < ActionController::Base
  before_action :authorized


  # def reservations
  #   session[:reservations] ||=[]
  # end
  #
  # def add_to_trips(trip_id)
  # 	reservations << trip_id
  # end
  #
  # def show_the_reservations
  #    @reserved_trips = reservations
  # end

  def current_user
    # byebug
    User.find_by({ id: session[:user_id] })
  end



  def logged_in? #makes curent user reflect it's boolean
    !!current_user
  end

  def authorized #(always redirect you to login page)
    redirect_to login_path unless logged_in? == true
  end

end
