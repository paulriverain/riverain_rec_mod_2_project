class UsersController < ApplicationController
  skip_before_action :authorized, only: [:login, :login_to, :new, :create]


  def login
    @user = User.new
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
    # byebug
    if current_user.id != params[:id].to_i
      redirect_to login_path
    else
      @user_now = current_user
      # get_user
    end
  end


  def edit
    get_user
    if current_user.id != @user.id
      redirect_to login_path
    else
      @user_now = current_user
    end
  end

  def update
    # @user = User.find(params[:id])
    get_user
    @user.update(get_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def destroy #Log out
    session[:user_id] = nil
    flash[:notice] = 'You are logged out.'
    redirect_to login_path
  end

  def clear_account #trash_account
    get_user
    Reservation.where(user_id: @user.id).destroy_all
    flash[:notice] = 'Your trips have been cleared'
    redirect_to user_path
  end


  def delete_account #deletes_account
    get_user
    Reservation.where(user_id: @user.id).destroy_all
    # flash[:notice] = 'Your trips have been cleared'

    User.destroy(@user.id)
    # byebug
    redirect_to login_path
    # Reservation.find_by(user_id: 4).all

  end



private
  def get_user
    @user = User.find(params[:id])
  end

  def get_params
    params.require(:user).permit(:user_name, :password)
  end

end
