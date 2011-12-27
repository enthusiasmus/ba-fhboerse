Fhboerse::Application.routes.draw do
  resources :jobs
  root :to => "Jobs#index"
  
  # user authentication
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end
