class BaseController < ApplicationController
  def index
  end

  def update
  	child = Child.find(params[:child_id])
  	child.last_lat = params[:lat]
  	child.last_lon = params[:lon]
  	child.save

  	render :index
  end
end
