class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  def index
    @title = "КАТАЛОГ"
    @products = Product.paginate(:all, :conditions => ["groups_products.group_id IN(?) and products.published = ?", Group.published.all, true], :include => [:groups], :page => params[:page])
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
    @group = Group.published.find(params[:id])
    @products = Product.paginate(:all, :conditions => ["groups_products.group_id IN(?) and products.published = ?", [@group] + @group.children, true], :include => [:groups], :page => params[:page])

    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.published.find(params[:id])
    @title = "КАТАЛОГ // #{@product.name}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end
end
