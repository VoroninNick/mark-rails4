class PlacesController < ApplicationController
  def set_place
    @place = Place.find(params[:id])
    @place.top = params[:top]
    @place.left = params[:left]
    #@place.save
    #render :nothing => true
  end
end
