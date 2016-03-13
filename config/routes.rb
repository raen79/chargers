Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations' }

  root 'charger#home'
  get '/charger/login_signup' => 'charger#login_signup', as: :login_signup
  get '/charger/all_chargers' => 'charger#all_chargers', as: :all_chargers
  get '/charger/my_chargers' => 'charger#my_chargers', as: :my_chargers
  get '/charger/new_charger' => 'charger#new_charger', as: :new_charger
  post '/charger' => 'charger#create_charger', as: :chargers
  get '/charger/:id' => 'charger#view_charger', as: :charger
  get '/charger/:id/edit' => 'charger#edit_charger', as: :edit_charger
  patch 'charger/:id' => 'charger#update_charger', as: :update_charger
  delete 'charger/:id' => 'charger#delete_charger', as: :delete_charger

  get '/ccharger/all_commercial_chargers' => 'charger#all_commercial_chargers', as: :all_commercial_chargers
  get '/ccharger/view_commercial_charger/:id' => 'charger#view_commercial_charger', as: :commercial_charger
  get '/ccharger/:id/new_c_comment' => 'charger#new_c_comment', as: :new_c_comment
  post '/ccharger/:id' => 'charger#create_c_comment', as: :c_comments
  get '/ccharger/:id/thumbs_c_up' => 'charger#thumbs_c_up', as: :thumbs_c_up
  get '/ccharger/:id/thumbs_c_down' => 'charger#thumbs_c_down', as: :thumbs_c_down

  get '/charger/:id/thumbs_up' => 'charger#thumbs_up', as: :thumbs_up
  get '/charger/:id/thumbs_down' => 'charger#thumbs_down', as: :thumbs_down
  get '/charger/:id/new_comment' => 'charger#new_comment', as: :new_comment
  post '/charger/:id' => 'charger#create_comment', as: :comments

  get '/get_price/:lat/:lng' => 'charger#get_price', :constraints => { :lat => /[^\/]+/, :lng => /[^\/]+/}
  get '/get_rating_points/:lat/:lng' => 'charger#get_rating_points', :constraints => { :lat => /[^\/]+/, :lng => /[^\/]+/}

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
