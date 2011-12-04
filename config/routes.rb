Fhboerse::Application.routes.draw do
  resources :home
  root :to => "Home#index"
  
  get "car_sharing/index"

  get "car_sharing/show"

  get "car_sharing/new"

  get "car_sharing/delete"

  get "market/index"

  get "market/show"

  get "market/new"

  get "market/delete"

  get "apartment_exchange/index"

  get "apartment_exchange/show"

  get "apartment_exchange/new"

  get "apartment_exchange/delete"

  get "repertory/index"

  get "repertory/show"

  get "repertory/new"

  get "repertory/delete"

  get "job_exchange/index"

  get "job_exchange/show"

  get "job_exchange/new"

  get "job_exchange/delete"

  get "home/index"

  get "articles/index"

  get "articles/show"

  get "articles/delete"

  get "articles/new"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
