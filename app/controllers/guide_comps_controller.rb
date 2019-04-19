class GuideCompsController < ApplicationController
  def index
    #code
    @user_now = current_user
    @comps = GuideComp.all
  end

  def show
    @user_now = current_user
    @comp = GuideComp.find(params[:id])
  end

end
