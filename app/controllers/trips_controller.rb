class TripsController < ApplicationController
  def index

    @user_now = current_user
    @trips = Trip.all

  end

  def show
    @trip = Trip.find(params[:id])
  end

  # private
  #
  # def get_params
  #     params.require(:trip).permit(:trip_name)
  # end


end
