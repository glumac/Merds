Lyricz::Application.routes.draw do

  devise_for :admins

  resources :musicians, only: [:index, :new, :create, :show]
  resources :words, only: [:index, :new, :create, :show]

  # get '/musicbranz_musicians' => 'musicbranz_musicians#index'
  # get '/musicbranz_musicians/new' => 'musicbranz_musicians#new'
  # post '/musicbranz_musicians' => 'musicbranz_musicians#create'

  # get '/musicbranz_musicians/:id' => 'musicbranz_musicians#show'

  post   '/musician_query' => 'musicians#musician_query'
  #method    url            controller  action

  # post '/jokes/:id/flag' => 'jokes#flag', as: 'flag_joke'

  post '/words/:id/is_common_word' => 'words#is_common_word', as: 'is_common_word'

  root :to => 'musicians#index'
  # post '/persons/create', to: "musicians#create"

end



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
  # match ':controller(/:action(/:id))(.:format)'
