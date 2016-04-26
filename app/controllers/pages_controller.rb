class PagesController < ApplicationController
  def index
    @title = "Home"
    @shares = Share.hot.limit(3)
    @articles = Article.published.limit(3)
    @partners = Partner.published
  end


  def contacts
    @contact = Contact.new params[:contact]
    if request.post? and @contact.valid?
      UserMailer.new_email_us(@contact).deliver
      flash[:notice] = "Your message was sent successfuly. Thank you!"
      render template: "frontend/contacts"
      #render :action => "contacts"
    else

    end
  end


end