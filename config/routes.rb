Rails.application.routes.draw do

  root 'welcome#index'

  resources :images

  resources :users
  post 'filter' => 'users#filter', as: 'filter'


  get 'signup' => 'users#new', as: 'signup'

  resource :sessions
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'

  # resources :messages, only: [:new, :create]

  post 'message' => 'users#send_message_to_user'
  # get 'messages' => 'messages#new', as: 'new_message'
  get 'one_register/:id' => 'users#one_register', as: 'one_register'
  get 'two_upload_photo/:id' => 'users#two_upload_photo', as: 'two_upload_photo'
  get 'three_interests/:id' => 'users#three_interests', as: 'three_interests'
  get 'four_moreinterests/:id' => 'users#four_moreinterests', as: 'four_moreinterests'
  get 'five_aboutus/:id' => 'users#five_aboutus', as: 'five_aboutus'
  #get 'six_login/:id' => 'users#six_login', as: 'six_login'

  # mailbox folder routes
 get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
 get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
 get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

 # conversations
 resources :conversations do
   member do
     post :reply
     post :trash
     post :untrash
   end
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
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
