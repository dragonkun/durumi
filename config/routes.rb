ActionController::Routing::Routes.draw do |map|
  map.resources :feedsettings

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.root :controller => 'frontpage', :action => 'index'
  map.admin '/admin', :controller => 'admin/dashboard', :action => 'index'
  map.resources :users, :collection => { :login_check => :get, :email_check => :get, :password_check => :get }
  map.resource :session
  map.resources :items
  map.namespace :services do |services|
    services.me2day '/me2day', :controller => 'me2day'
    services.friendfeed '/friendfeed', :controller => 'friendfeed'
    services.blog '/blog', :controller => 'blog'
    services.delicious '/delicious', :controller => 'delicious'
    services.googlereader '/googlereader', :controller => 'googlereader'
    services.lastfm '/lastfm', :controller => 'lastfm'
    services.youtube '/youtube', :controller => 'youtube'
    services.flickr '/flickr', :controller => 'flickr'
    services.twitter '/twitter', :controller => 'twitter'
    services.customfeed '/customfeed', :controller => 'customfeed'
    services.lemonpen '/lemonpen', :controller => 'lemonpen'
    services.springnote '/springnote', :controller => 'springnote'
    services.rollinglist '/rollinglist', :controller => 'rollinglist'
  end
  map.resources :services
	map.page_base_items '/items/pages/:page/', :controller => 'items', :action => 'index'

  map.namespace :admin do |admin|
    admin.settings '/settings', :controller => 'settings'
    admin.profile '/profile', :controller => 'profile'
    admin.dashboard '/dashboard', :controller => 'dashboard'
		admin.resources :users

		admin.resources :feeds, :member => { :fetch => :post }
		admin.new_feed_by_service_identifier '/feeds/new/:service_identifier', :controller => 'feeds', :action => 'new'

		admin.resources :items
  end

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
  # consider removing the them or commenting them out if you're using named routes and resources.
	
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
