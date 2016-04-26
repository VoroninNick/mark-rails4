class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_not_found
    render template: "errors/not_found.html.erb", status: 404
  end

  def about_page?
    controller_name == "pages" && action_name == "about"
  end

  helper_method :about_page?
end
