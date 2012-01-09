Fhboerse::Application.routes.draw do
  # static pages
  get "pages/agb"
  get "pages/about"
  get "pages/contact"
  get "contact_us/new"

  # modules
  resources :apartments
  resources :drives
  resources :items
  resources :jobs
  resources :products
  
  # root route
  get "home/index"
  root :to => "Home#index"
  
  # user authentication
  match "/auth/:provider/callback" => "users#create"
  match "/signout" => "users#signout", :as => :signout
  
  # edit user profile
  match "/profile/edit" => "users#edit", :as => :profile
  match "/profile/update" => "users#update", :via => 'put'
end

