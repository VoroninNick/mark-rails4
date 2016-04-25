Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#index"
  resources :schemas, only: [:index, :show]

  resources :inspirations, only: [:index, :show]

  scope "products", controller: "products" do
    root action: "index", as: :products
    get "grouped_by/:id", :action => "grouped_by"
    get ":id", action: :show, as: "product"
  end

  scope "shares", controller: "shares" do
    root action: "index", as: :shares
    get "hot/:id", :action => "grouped_by"
    get ":id", action: :show, as: "share"
  end

  resources :articles, only: [:index, :show]

  post "/places/update_place", to: "places#set_place", as: :update_place


  controller "pages" do
    get "about", action: "about", :as => "about_us"
    get "contacts", :action => "contacts"
  end










end
