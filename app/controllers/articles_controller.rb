class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @title = "НОВИНИ"
    @articles = Article.published.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.published.find(params[:id])
    @title = "НОВИНИ // #{@article.name.force_encoding("utf-8")}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

end
