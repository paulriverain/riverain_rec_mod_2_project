class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def login_to
    @user = User.find_by(get_params)
    if @user
      redirect_to trips_path
    else
      flash[:errors] = "Improper Username or Password:"
      redirect_to login_path
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create(get_params)
    if @user.valid?
      redirect_to trips_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_new_path
    end
  end


  def show
    @user = User.find(get_params)
  end


  # 
  # def edit
  #   #code
  #     @user = User.find(get_params)
  # end

  # def update
  #   #code
  #   flash[:notice] = "Added to trips"
  #   add_to_trips(@trip.id)
  # end



private

  def get_params
    params.require(:user).permit(:user_name)
  end

end
