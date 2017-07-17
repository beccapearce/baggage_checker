Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  get 'users' => 'users#index'
  resources :users

   resources :sessions,      only: [:new, :create, :destroy]

   match '/signup',  to: 'users#new',            via: 'get'
match '/signin', to: 'sessions#new',        via: 'get'
match '/signout', to: 'sessions#destroy', via: 'delete'

  # get 'sessions/new'
  # post "/sessions/new", to: "sessions#create", as: "signin"

  get 'bags' => 'bags#index'
  resources :bags
end
