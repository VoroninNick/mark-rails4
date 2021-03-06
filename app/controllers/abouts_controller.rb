class AboutsController < ApplicationController

  def index
    return redirect_to about_path(About.published.first), status: 302
    @title = "About us"
    @about = About.published.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @about }
    end
  end


  def show
    begin
      @about = About.published.find(params[:id])
    rescue
      return render_not_found
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @about }
    end
  end
  
end
