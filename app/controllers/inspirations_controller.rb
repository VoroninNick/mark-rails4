class InspirationsController < ApplicationController
  # GET /inspirations
  def index
    @title = "Натхнення"
    @inspirations = Inspiration.published.order('created_at DESC').page(params[:page])
  end

  # GET /inspirations/1
  def show
    @inspiration = Inspiration.published.find(params[:id])
    @title = "Натхнення // #{@inspiration.name.force_encoding("utf-8")}"
  end

end
