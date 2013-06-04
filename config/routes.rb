Loteria::Application.routes.draw do
  
  resources :home, :only => [:index]
  match '/home' => 'home#index', :via => :post

  resources :analise, :only => [:index]
  match '/analise' => 'analise#index', :via => :post
  	
  resources :transforme, :only => [:index]

  resources :premiacao, :only => [:index]

  resources :resultado, :except => [:show]
  match "resultado/acompanhamento" => "resultado#acompanhamento"
  
  resources :lotofacil, :only => [:index]

  root :to => 'home#index'
end
