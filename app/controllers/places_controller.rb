class PlacesController < ApplicationController
  def set_place
    begin
      @place = Place.find(params[:id])
    rescue
      return render_not_found
    end
    @place.top = params[:top]
    @place.left = params[:left]
    #@place.save
    #render :nothing => true
  end
end
