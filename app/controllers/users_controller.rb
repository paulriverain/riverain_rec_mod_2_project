class UsersController < ApplicationController
  skip_before_action :authorized, only: [:login, :login_to, :new, :create]


  def login
    @user = User.new
  end

  def login_to
    # @user = User.find_by(get_params)
    # if @user
    #   redirect_to trips_path
    # else flash[:errors] = "Improper Username or Password:"
    #   redirect_to login_path
    # end

    @user = User.find_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user][:password])
      # byebug
      session[:user_id] = @user.id
      # byebug
      redirect_to trips_path
    else
      # byebug
      flash[:notice] = "Invalid username or password"
      redirect_to login_path
     end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create(get_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to trips_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_new_path
    end
  end


  def show
    # @user = User.find(get_params)
    # show_the_reservations
    get_user
    @reserved_trips = @user.trips

    # byebug
  end


  def edit
    #code
      # @user = User.find(get_params)
      get_user
      # byebug
  end

  def update
    #code
    @user = User.update(get_params)
    if @user.valid?
      redirect_to trips_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_new_path
    end
  end

  def destroy
    #code
    get_user.destroy
    redirect_to login_path
  end


  # def likes
  #   session[:likes] ||=[]
  # end
  #
  # def add_to_trips(trip_id)
  # 	likes << trip_id
  # end
  #
  # def show_the_likes
  #    @liked_trips = likes
  # end


private
  def get_user
    #code
    @user = User.find(params[:id])
  end


  def get_params
    # byebug
    params.require(:user).permit(:user_name, :password)
  end

end
