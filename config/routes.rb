Loteria::Application.routes.draw do
  
  resources :home, :only => [:index]
  match '/home' => 'home#index', :via => :post

  resources :analise, :only => [:index]
  match '/analise' => 'analise#index', :via => :post
  	
  resources :transforme, :only => [:index]

  resources :resultado

  root :to => 'home#index'
end
