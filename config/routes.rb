Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  get 'users' => 'users#index'
  resources :users

  get 'bags' => 'bags#index'
  resources :bags
end
