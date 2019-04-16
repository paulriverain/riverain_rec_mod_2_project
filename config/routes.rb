Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  #
  get '/users/:id/edit', to: 'users#edit'
  post '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  # get '/users/:id', to: 'users#show'
  post '/reservations', to: 'reservations#create'

  # resources :users, only: [:new, :create, :show]
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # get '/users/:id', to: 'users#show'
  #
  # get '/guide_comps/:id', to: 'guide_comps#show'
  resources :trips, only: [:index, :show]
  resources :guide_comps, only: [:index, :show]

  get '/login', to: 'users#login'
  post '/login', to: 'users#login_to'
end
