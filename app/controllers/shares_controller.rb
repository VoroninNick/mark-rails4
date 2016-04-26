class SharesController < ApplicationController
  # GET /actions
  # GET /actions.xml
  def index
    @title = "АКЦІЇ"
    @shares = Share.published.order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shares }
    end
  end

  # GET /actions/1
  # GET /actions/1.xml
  def show
    begin
      @share = Share.published.find(params[:id])
    rescue
      return render_not_found
    end
    @title = "АКЦІЇ // #{@share.name.force_encoding("utf-8")}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @share }
    end
  end

  def hot
    begin
      @products = Share.hot.published.find(params[:id])
    rescue
      return render_not_found
    end
    @title = "АКЦІЇ // #{@share.name}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @share }
    end
  end

end
