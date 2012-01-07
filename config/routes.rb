Fhboerse::Application.routes.draw do
  get "items/index"

  get "items/show"

  get "items/new"

  # static pages
  get "pages/agb"
  get "pages/about"
  get "pages/contact"

  # modules
  resources :apartments
  resources :drives
  resources :items
  resources :jobs
  resources :products
  
  # root route
  root :to => "Jobs#index"
  
  # user authentication
  match "/auth/:provider/callback" => "users#create"
  match "/signout" => "users#signout", :as => :signout
  
  # edit user profile
  match "/profile/edit" => "users#edit", :as => :profile
  match "/profile/update" => "users#update", :via => 'put'
end

