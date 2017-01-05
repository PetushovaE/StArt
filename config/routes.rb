Rails.application.routes.draw do
	
	root 'welcome#home'
	get '/about', to: 'welcome#about'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'

	resources :users do
		resources :exhibitions 
	end


	resources :exhibitions do
		resources :comments
	end

	resources :comments
	resources :rsvps

	get '/auth/facebook/callback' => 'sessions#create'
	get '/auth/github/callback' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
