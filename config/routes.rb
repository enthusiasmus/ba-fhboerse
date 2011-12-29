Fhboerse::Application.routes.draw do
  resources :apartments
  resources :drives
  resources :items
  resources :jobs
  resources :products
  root :to => "Jobs#index"
  
  # user authentication
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end
