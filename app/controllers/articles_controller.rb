class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @title = "НОВИНИ"
    @articles = Article.published.order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    begin
      @article = Article.published.find(params[:id])
    rescue
      return render_not_found
    end
    @title = "НОВИНИ // #{@article.name.force_encoding("utf-8")}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

end
