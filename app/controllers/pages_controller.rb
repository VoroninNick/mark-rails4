class PagesController < ApplicationController
  def index
    @title = "Home"
    @shares = Share.hot.limit(3)
    @articles = Article.published.limit(3)
    @partners = Partner.published
  end

  def about
    @title = "About us"
    @about = About.published.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @about }
    end
  end

  def contacts
    @contact = Contact.new params[:contact]
    if request.post? and @contact.valid?
      User.deliver_email_us(@contact)
      flash[:notice] = "Your message was sent successfuly. Thank you!"
      render template: "frontend/contacts"
      #render :action => "contacts"
    else
      render :action => "contacts"
    end
  end


end