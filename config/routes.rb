Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations' }

  root 'charger#home'
  get '/charger/login_signup' => 'charger#login_signup', as: :login_signup
  get '/charger/all_chargers' => 'charger#all_chargers'
  get '/charger/my_chargers' => 'charger#my_chargers', as: :my_chargers
  get '/charger/new_charger' => 'charger#new_charger', as: :new_charger
  post '/charger' => 'charger#create_charger', as: :chargers
  get '/charger/:id' => 'charger#view_charger', as: :charger
  get '/charger/:id/edit' => 'charger#edit_charger', as: :edit_charger
  patch 'charger/:id' => 'charger#update_charger', as: :update_charger
  delete 'charger/:id' => 'charger#delete_charger', as: :delete_charger

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
