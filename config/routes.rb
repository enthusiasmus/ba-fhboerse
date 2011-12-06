Fhboerse::Application.routes.draw do
  resources :home
  resources :articles
  root :to => "Home#index"
end
