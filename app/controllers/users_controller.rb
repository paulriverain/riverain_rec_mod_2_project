class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def login_to
    @user = User.find_by(get_params)
    if @user.valid?
      redirect_to trips_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
  
    @user = User.create(get_params)
    redirect_to trips_path
  end

  def show
    @user = User.find_by(get_params)
    # @user = User.find(params[:id])
  end



private

def get_params
    params.require(:user).permit(:user_name)
  end

end
