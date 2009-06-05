ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  map.resources :votes
  # ruta por defecto
  map.connect '', :controller => 'welcome', :action => 'welcome'
  map.connect 'terms', :controller => 'welcome', :action => 'terms'
  map.connect 'faq', :controller => 'welcome', :action => 'faq'
  map.connect 'scheme', :controller => 'welcome', :action => 'scheme'
  map.connect 'privacy', :controller => 'welcome', :action => 'privacy'
  
  map.auth 'auth/:action/:id',
    :controller => 'auth', :action => nil, :id => nil
  map.authadmin 'authadmin/:action/:id',
    :controller => 'authadmin', :action => nil, :id => nil
  map.authadmin 'admin/:action/:id',
    :controller => 'admin', :action => nil, :id => nil
  
  map.connect '/code/:id/tag/:tags/rss.xml',                :controller => 'user', :action => 'feevy_rss'
  map.connect '/code/:id/tags/:tags/rss.xml',               :controller => 'user', :action => 'feevy_rss'
  map.connect '/code/:id/rss.xml',                          :controller => 'user', :action => 'feevy_rss'
  
  map.connect '/code/:id/tag/:tags/style/:style',   :controller => 'user', :action => 'feevy'
  map.connect '/code/:id/tag/:tags/:style',         :controller => 'user', :action => 'feevy'
  map.connect '/code/:id/tag/:tags',                :controller => 'user', :action => 'feevy'
  map.connect '/code/:id/tags/:tags/style/:style',  :controller => 'user', :action => 'feevy'
  map.connect '/code/:id/tags/:tags/:style',        :controller => 'user', :action => 'feevy'
  map.connect '/code/:id/tags/:tags',               :controller => 'user', :action => 'feevy'
  map.connect '/code/:id/:style',                   :controller => 'user', :action => 'feevy'
  map.connect '/code/:id',                          :controller => 'user', :action => 'feevy'

  map.connect '/stats/:id/tag/:tags/style/:style',   :controller => 'user', :action => 'stats'
  map.connect '/stats/:id/tag/:tags/:style',         :controller => 'user', :action => 'stats'
  map.connect '/stats/:id/tag/:tags',                :controller => 'user', :action => 'stats'
  map.connect '/stats/:id/tags/:tags/style/:style',  :controller => 'user', :action => 'stats'
  map.connect '/stats/:id/tags/:tags/:style',        :controller => 'user', :action => 'stats'
  map.connect '/stats/:id/tags/:tags',               :controller => 'user', :action => 'stats'
  map.connect '/stats/:id/:style',                   :controller => 'user', :action => 'stats'
  map.connect '/stats/:id',                          :controller => 'user', :action => 'stats'

  ######################## reports

  map.connect '/report/users/:id/tag/:tags',		:controller => 'report', :action =>'users'
  map.connect '/report/users/:id/tag/',			:controller => 'report', :action =>'users'
  map.connect '/report/users/:id',			:controller => 'report', :action =>'users'


  
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
