class UsersController < ApplicationController
  skip_before_action :authorized, only: [:login, :login_to, :new, :create]


  def login
    @user = User.new
    render :layout => false
  end

  def login_to
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to trips_path
    else
      flash[:notice] = "Invalid username or password"
      redirect_to login_path
     end
  end


  def new
    @user = User.new
    render :layout => false
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
    get_user
    @reserved_trips = @user.trips
  end


  def edit
      get_user
  end

  def update

    @user = User.find(params[:id])
    @user.update(get_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You are logged out.'
    redirect_to login_path
  end


private
  def get_user
    @user = User.find(params[:id])
  end


  def get_params
    params.require(:user).permit(:user_name, :password)
  end

end
