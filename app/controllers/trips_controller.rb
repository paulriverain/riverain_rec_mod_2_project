class TripsController < ApplicationController
  def index
    @trips = Trip.all
    # @current_user = signed_in
    # @trips = @current_user.trips.all
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
