class SchemasController < ApplicationController
  before_filter :preload_schemas
  
  def index
    
  end
  
  def show
    @schema = Schema.published.find(params[:id])
    @places = @schema.places.find(:all, :order => "name ASC")
  end
  
  private
  
  def preload_schemas
    @schemas = Schema.published.all
  end
end
