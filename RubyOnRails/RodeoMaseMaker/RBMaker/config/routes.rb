Rails.application.routes.draw do
  get 'items', to: 'items#new'
  get 'new_buzz_outer', to: 'items#new_buzz_outer'
  get 'new_buzz_tops', to: 'items#new_buzz_tops'
  get 'new_buzz_bottoms', to: 'items#new_buzz_bottoms'
  get 'new_buzz_ragran', to: 'items#new_buzz_ragran'
  get 'new_buzz_other', to: 'items#new_buzz_other'
  get 'new_sugar_outer', to: 'items#new_sugar_outer'
  get 'show_sugar_outer', to: 'items#show_sugar_outer'
  
  root to: 'static_pages#home'
  
  #resources :items

  resources :items do
    get 'made_sugar_outer', :on => :member
    
  #以下アウトプットのためのルート設定
    get 'output_rakutenPC', :on => :member
    get 'output_rakutenSP', :on => :member
    get 'output_rakutenMobile', :on => :member
    get 'output_YahooPC', :on => :member
    get 'output_OfficialPC', :on => :member
    get 'output_DeNA', :on => :member
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
