Rails.application.routes.draw do

  resources :assignments


  resources :widgets

  devise_for :users, controllers: { 
    omniauth_callbacks: 'omniauth_callbacks', sessions: "sessions" }
    
  root 'pages#index'
 
  get 'grader_dashboard', to: 'pages#grader_dashboard'
  get 'grader_student_solution', to: 'users#grader_student_solution'
  get 'student_input_and_solution', to: 'assignments#show'
  get 'update_assignments', to: 'users#update_assignments'
   get 'admin_edit_users', to: 'users#admin_edit_users'
  
  
  match 'assignments/:id/count' => 'assignments#count', :via => [:get], as: :assignments_count
  
resources :pages
resources :assignments
  resource :user, only: [:edit] do
    collection do
      patch 'update_user'
    end
  end
  resource :user, only: [:admin_edit_users] do
    collection do
      patch 'update_user'
    end
  end
  resource :pages, only: [:edit] do
    collection do
      patch 'update'
    end
  end
  resources :pages do
    member do
        get :count
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
