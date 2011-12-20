Fhboerse::Application.routes.draw do
  resources :jobs
  root :to => "Jobs#index"
end
