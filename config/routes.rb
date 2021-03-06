PogApp::Application.routes.draw do


  devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_for :analysts, :controllers => { :sessions => "analysts/sessions",:registrations => "analysts/registrations" }
  resources :properties, only: [:create, :destroy, :show]
  
  root 'static_pages#home'

  get '/help',            to: 'static_pages#help'
  get '/about',           to: 'static_pages#about'
  get '/contact',         to: 'static_pages#contact'
  get '/profile/:id',     to: 'static_pages#profile',as: :profiles
  get '/profile',         to: 'static_pages#own_profile',as: :profile
  get '/download_document/:id',to: 'properties#download_document',as: :document

  namespace :analysts do
    root :to => "analysts#index"
    get '/profile',to: 'analysts#profile'
    get '/edit_profile',to: 'analysts#edit_profile'
    post '/upload_document',to: 'properties#upload_document',as: :upload_document
    get '/download_document/:id',to: 'properties#download_document',as: :document
    delete "/destroy_document/:id",to: 'properties#destroy_document',as: :destroy_document
    resources :analysts, only: [:index,:update, :destroy, :show]
    resources :users
    resources :properties, only: [:index, :show]
  end
  
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

end
