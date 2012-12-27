Loteria::Application.routes.draw do
  
  resources :home, :only => [:index]
  match '/home' => 'home#index', :via => :post

  resources :analise, :only => [:index]
  match '/analise' => 'analise#index', :via => :post

  root :to => 'home#index'
end
