Fhboerse::Application.routes.draw do
  # static pages
  get "pages/agb"
  get "pages/about"
  get "contact_us/new"

  # modules
  resources :apartments, :only => [:create, :destroy, :index, :new, :show]
  resources :drives, :only => [:create, :destroy, :index, :new, :show]
  resources :items, :only => [:create, :destroy, :index, :new, :show]
  resources :jobs, :only => [:create, :destroy, :index, :new, :show]
  resources :products, :only => [:create, :destroy, :index, :new, :show]
  
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

