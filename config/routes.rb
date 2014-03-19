Final::Application.routes.draw do
  resources :users
  resources :calculations
  root :to => "sessions#login"
  
  get "sessions/login"
  get "sessions/edit"
  get "users/profile"
  get "users/new"
  get "calculations/index"
  get "calculations/show"

  get "calculate", :to => "calculations#index"
  get "history", :to => "calculations#show"

  get "home", :to => "users#index"
  get "profile", :to => "users#show"
  get "signup", :to => "users#new"

	get "login", :to => "sessions#login"
	get "logout", :to => "sessions#logout"

  post ':controller(/:action(/:id(.:format)))'
  post ':controller(/:action(.:format))'
end
