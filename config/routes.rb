PBNC::Application.routes.draw do

  root 'pages#home'
  resources :charges
  resources :payments  
  resources :students do
    resources :school
  end
  resources :schools do
    resources :students
  end
  resources :parents

  #static routes
  # match '/home' => 'pages#home'
  # match '/about' => 'pages#about'
  # match '/contact' => 'pages#contact'


#dvu:   , :as => 'parents'...this gives us an alias like "parents_path" which we can use in our code/templates
  get "pages/home", :as => 'home'
  get "pages/why", :as => 'why'
  get "pages/eyebus", :as => 'eyebus'
  get "pages/components", :as => 'components'
  get "pages/outcomes", :as => 'outcomes'
  get "pages/partners", :as => 'partners'
  get "pages/supporters", :as => 'supporters'
  get "pages/screening_services", :as => 'screening_services'
  get "pages/parents", :as => 'parents_static'
  # get "pages/payments"
  get "pages/schools", :as => 'schools_static'
  get "pages/FAQ", :as => 'faq'
  get "pages/about", :as => 'about'
  get "pages/staff", :as => 'staff'
  get "pages/council", :as => 'council'

  get "register_parent", to: 'charges#registerparent'
  get "register_student", to: 'charges#registerstudent'
  get "payment", to: 'charges#payment'

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
