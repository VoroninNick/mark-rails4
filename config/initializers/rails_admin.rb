RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.include_models About, Article, Banner, Contact, Group, Image, Inspiration, Page, Partner, Place, Product, Schema, Share, User

  config.model About do
    field :published
    field :name
    field :description
    field :children
    field :images
  end

  config.model Group do
    field :published
    field :name
    #field :position
    field :children
    field :products
  end

  config.model Image do
    visible false
  end

  config.model Partner do
    field :published
    field :name
    field :url
    field :avatar
  end

  config.model Place do
    field :product
    field :schema
    field :name
    field :left
    field :top
  end

  config.model User do
    field :email
    field :password
    field :password_confirmation
  end

  config.model Banner do
    field :publish
    field :name
    field :link
    field :avatar
  end



end
