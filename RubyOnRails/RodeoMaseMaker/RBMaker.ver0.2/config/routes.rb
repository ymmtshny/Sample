Rails.application.routes.draw do
  #get 'items', to: 'items#new'
  root to: 'static_pages#home'
  get 'showingalldata' => 'items#showall'
  get '/items/new/brand/:brand_id/category/:category', to: 'items#new', as: 'new_item'
  #post '/items/new/brand/:brand_id/category/:category/create', to: 'items#create', as: 'create'
  get '/items/new/brand/:brand_id/category/:category/:id', to: 'items#show', as: 'show'
  get '/items/new/brand/:brand_id/category/:category/:id/edit', to: 'items#edit', as: 'edit'
  put '/items/new/brand/:brand_id/category/:category/:id/update', to: 'items#update', as: 'update'
  get '/items/new/brand/:brand_id/category/:category/:id/output_rakutenPC', to: 'items#output_rakutenPC', as: 'output_rakutenPC'
  get '/items/new/brand/:brand_id/category/:category/:id/output_rakutenSP', to: 'items#output_rakutenSP', as: 'output_rakutenSP'
  get '/items/new/brand/:brand_id/category/:category/:id/output_rakutenMobile', to: 'items#output_rakutenMobile', as: 'output_rakutenMobile'
  get '/items/new/brand/:brand_id/category/:category/:id/output_YahooPC', to: 'items#output_YahooPC', as: 'output_YahooPC'
  get '/items/new/brand/:brand_id/category/:category/:id/output_YahooSP', to: 'items#output_YahooSP', as: 'output_YahooSP'
  get '/items/new/brand/:brand_id/category/:category/:id/output_OfficialPC', to: 'items#output_OfficialPC', as: 'output_OfficialPC'
  get '/items/new/brand/:brand_id/category/:category/:id/output_DeNA', to: 'items#output_DeNA', as: 'output_DeNA'
  
  
  resources :items #do
    
  # #以下アウトプットのためのルート設定
  #   get 'output_rakutenPC', :on => :member
  #   get 'output_rakutenSP', :on => :member
  #   get 'output_rakutenMobile', :on => :member
  #   get 'output_YahooPC', :on => :member
  #   get 'output_OfficialPC', :on => :member
  #   get 'output_DeNA', :on => :member
  #end


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
