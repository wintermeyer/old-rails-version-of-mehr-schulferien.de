MehrSchulferienDe::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create', via: [:get]

  resources :authentications, only: [:create]

  devise_for :users
  resources :schools, only: [:show, :edit, :update]

  resources :vacation_periods, only: [:show]

  # resources :vacation_periods, only: [:index, :show]

  # resources :vacation_types, only: [:index, :show]

  # resources :years, only: [:index, :show]

  # resources :months, only: [:index, :show]

  # resources :days, only: [:index, :show]

  root 'page#index'

  get "page/index"
  get "page/about_us"
  #get "page/developer"
  # get "page/api"
  # resources :schools, only: [:index, :show]

  resources :cities, only: [:show] do
    resources :schools, only: [:index]
  end

  resources :federal_states, only: [:index, :show] do
    resources :years, only: [:show, :index]
    resources :cities, only: [:index]
  end

  # resources :countries, only: [:index, :show]

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
