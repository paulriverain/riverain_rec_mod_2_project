class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def login
    # @users = User.all

    @user = User.new
    # render login_to_path
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

  def show
    @user = User.find_by(get_params)
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(get_params)
    redirect_to trips_path
  end


private

def get_params
    params.require(:user).permit(:user_name)
  end

end
