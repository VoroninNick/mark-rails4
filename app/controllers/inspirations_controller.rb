class InspirationsController < ApplicationController
  # GET /inspirations
  def index
    @title = "Натхнення"
    @inspirations = Inspiration.published.paginate :page => params[:page], :order => 'created_at DESC'
  end

  # GET /inspirations/1
  def show
    @inspiration = Inspiration.published.find(params[:id])
    @title = "Натхнення // #{@inspiration.name.force_encoding("utf-8")}"
  end

end
