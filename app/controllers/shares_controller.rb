class SharesController < ApplicationController
  # GET /actions
  # GET /actions.xml
  def index
    @title = "АКЦІЇ"
    @shares = Share.published.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shares }
    end
  end

  # GET /actions/1
  # GET /actions/1.xml
  def show
    @share = Share.published.find(params[:id])
    @title = "АКЦІЇ // #{@share.name.force_encoding("utf-8")}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @share }
    end
  end

  def hot
    @products = Share.hot.published.find(params[:id])
    @title = "АКЦІЇ // #{@share.name}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @share }
    end
  end

end
