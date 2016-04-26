class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  def index
    @title = "КАТАЛОГ"
    @products = Product.all.where("groups_products.group_id IN(?) and products.published = ?", Group.published.all, true).includes(:groups).page(params[:page])
    # unless @products.nil?
    #   @products = @products.force_encoding("utf-8")
    # end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  def grouped_by
    @title = "КАТАЛОГ"
    begin
      @group = Group.published.find(params[:id])
    rescue
      return render_not_found
    end
    @products = Product.all.where("groups_products.group_id IN(?) and products.published = ?", [@group] + @group.children, true).includes(:groups).paginate(:include => [:groups], :page => params[:page])

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    begin
      @product = Product.published.find(params[:id])
    rescue
      return render_not_found
    end
    @title = "КАТАЛОГ // #{@product.name}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end
end
