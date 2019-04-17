Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users/:id/edit', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  # post '/users/:id', to: 'users#delete_all_trips', as: 'trash_trips'
  delete '/users/:id/clear', to: 'users#clear_account', as: 'trash_account'

  delete '/users/:id/edit', to: 'users#delete_account', as: 'delete_account'



  post '/reservations', to: 'reservations#create'
  delete '/reservations/:id', to: 'reservations#destroy', as: 'remove_reservation'


  resources :trips, only: [:index, :show, :destroy]
  resources :guide_comps, only: [:index, :show]

  get '/login', to: 'users#login'
  post '/login', to: 'users#login_to'

  post '/logout', to: 'users#destroy', as: 'logout'
end
