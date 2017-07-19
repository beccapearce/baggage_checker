Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  get 'users' => 'users#index'
  resources :users

  resources :sessions,      only: [:new, :create, :destroy, :delete]


  get '/signout', to: 'sessions#destroy'



  get 'bags' => 'bags#index'
  resources :bags
end
