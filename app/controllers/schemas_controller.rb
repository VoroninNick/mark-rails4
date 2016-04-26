class SchemasController < ApplicationController
  before_filter :preload_schemas
  
  def index
    
  end
  
  def show
    begin
      @schema = Schema.published.find(params[:id])
    rescue
      return render_not_found
    end
    @places = @schema.places.order("name ASC")
  end
  
  private
  
  def preload_schemas
    @schemas = Schema.published.all
  end
end
