class AboutsController < ApplicationController

  def show
    @about = About.published.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @about }
    end
  end
  
end
