Rails.application.routes.draw do


  namespace :public do
    #Homes
    get '/' => "homes#top"
    get 'about' => "homes#about"
    #Items
    resources :items, only: [:index, :show]
    #Registration
    resources :registrations, only: [:new, :create]
    #Sessions
    resources :sessions, only: [:new, :create, :destroy]
    #Customers
    get "customers/home" => "customers#show"
    get "customers/edit" => "customers#edit"
    patch "customers" => "customers#update"
    get "customers/confimation" => "customers#confimation"
    patch "customers/confimation" => "customers#withdraw", as: :withdraw_customer
    #Cart_Items
    get "cart_items" => "cart_items#index"
    patch "cart_items/:id" => "cart_items#update", as: :update_cart_item
    delete "cart_items/:id/destroy" => "cart_items#destroy", as: :destroy_cart_item
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: :destroy_all_cart_item
    post "cart_items" => "cart_items#create"
    #Orders
    get "orders" => "orders#index"
    get "orders/new" => "orders#new", as: :new_order
    get "orders/:id" => "orders#show", as: :show_order
    get "orders/confimation" => "orders#confimation"
    get "orders/thanks" => "orders#thanks"
    post "orders/new" => "orders#create", as: :create_order
    #Addresses
    get "addresses" => "addresses#index"
    get "addresses/:id/edit" => "addresses#edit", as: :edit_address
    post "addresses" => "addresses#create", as: :create_address
    patch "addresses/:id" => "addresses#update", as: :update_address
    delete "addresses/:id" => "addresses#destroy", as: :destroy_address
  end

  namespace :admin do
    #Homes
    get "/" => "homes#top"
    #Items
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    #Genres
    get "genres" => "genres#index"
    post "genres" => "genres#create"
    get "genres/:id/edit" => "genres#edit", as: :edit
    patch "genres/:id" => "genres#update", as: :update_genre
    #Customers
    get "customers" => "customers#index"
    get "customers/:id" => "customers#show"
    get "customers/:id/edit" => "customers#edit", as: :edit_customers
    patch "customers/:id" => "customers#update", as: :update_customer
    #Orders
    get "orders/:id" => "orders#show", as: :order
    patch "orders/:id" => "orders#update", as: :order_update
    #Order_Details
    patch "order_details/:id" => "order_details#update", as: :order_detail_update
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



end
