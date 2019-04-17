class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    #code
    @reservation = Reservation.create(trip_id: params[:trip_id], user_id: params[:user_id])
    flash[:notice] = "Added to trips"
    redirect_to trips_path#user_path(params[:user_id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(@reservation.user_id)
  end

end
