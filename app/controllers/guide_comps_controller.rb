class GuideCompsController < ApplicationController
  def index
    #code
    @comps = GuideComp.all
  end

  def show
    @comp = GuideComp.find(params[:id])
  end

end
