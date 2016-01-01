ActionController::Routing::Routes.draw do |map|
  map.home '/home',   :controller => 'users', :action => 'index'
  map.resources :users
  map.resource  :home, :controller => "users"
  map.resources :user_sessions
  map.resources :lists
  map.resources :visits


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.login '/login',   :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.signup '/signup', :controller => 'users'   , :action => 'new'
  map.list_myspace '/list/myspace',     :controller => 'lists'   , :action => 'new'
  map.find '/property',     :controller => 'lists' ,   :action => 'find'
  map.property '/property/:id',   :controller => 'visits'   ,   :action => 'show'
  map.property_visit '/property/:id/visit',   :controller => 'visits'   ,   :action => 'new'
  map.my_space '/myspace',  :controller => "lists", :action=>"my_space"
  map.my_plan '/plans',    :controller => "lists", :action=>"my_plan" 
  map.view_myplan '/plan/:id',   :controller => "visits", :action=> "view"
  map.view_myspace 'myspace/:id',   :controller => "lists", :action=> "view"  
  map.root :controller => "users", :action => "index"
end
