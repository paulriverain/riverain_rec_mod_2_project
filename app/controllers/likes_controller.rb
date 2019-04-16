class LikesController < ApplicationController


    def edit
      #code
        # @user = User.find(get_params)
    end


  def update
    #code
    @trip = Trip.find(params[:trip_id])
    flash[:notice] = "Added to trips"
    add_to_trips(@trip.id)

    redirect_to trips_path
  end

end
