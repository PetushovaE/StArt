Rails.application.routes.draw do
	
	root 'welcome#home'
	get '/about', to: 'welcome#about'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get    '/login', to: 'sessions#new'
  	post   '/login', to: 'sessions#create'
  	delete '/logout', to: 'sessions#destroy'

  	resources :exhibitions 
	resources :comments
	resources :rsvps

	resources :users do
		resources :exhibitions 
	end

	resources :users do
		resources :rsvps 
	end

	resources :exhibitions do
		resources :comments
	end

	resources :users do
		resources :comments 
	end
	
	

	get '/auth/facebook/callback' => 'sessions#create'
	get '/auth/github/callback' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
