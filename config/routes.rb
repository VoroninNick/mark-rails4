Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#index"
  resources :schemas, only: [:index, :show]

  resources :inspirations, only: [:index, :show]

  scope "products", controller: "products" do
    root action: "index", as: :products
    get "grouped_by/:id", :action => "grouped_by", as: "grouped_products"
    get ":id", action: :show, as: "product"
  end

  scope "shares", controller: "shares" do
    root action: "index", as: :shares
    get "hot/:id", :action => "grouped_by"
    get ":id", action: :show, as: "share"
  end

  resources :articles, only: [:index, :show]

  post "/places/update_place", to: "places#set_place", as: :update_place

  scope "about", controller: "abouts" do
    root action: "index", :as => "about_root"
    get ":id", action: "show", :as => "about"
  end
  controller "pages" do

    get "contacts", :action => "contacts"
  end








  match "*args", to: "application#render_not_found", as: "not_found", via: [:get, :post, :update, :create, :put, :delete]

end
