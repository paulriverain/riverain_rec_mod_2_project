class ReservationsController < ApplicationController


    # def edit
    #   #code
    #     # @user = User.find(get_params)
    # end

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
    # Reservation.find(trip_id: params[:trip_id], user_id: params[:user_id]).destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(@user.id)
  end



  # def update
  #   #code
  #   @trip = Trip.find(params[:trip_id])
  #   # flash[:notice] = "Added to trips"
  #   add_to_trips(@trip.id)
  #
  #   redirect_to trips_path
  # end

end
