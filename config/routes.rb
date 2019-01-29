Rails.application.routes.draw do
  root 'users#new'
	get 'events/:id/join' => 'events#join_event', as: :join
	resources :users
	resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
