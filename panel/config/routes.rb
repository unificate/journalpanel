Rails.application.routes.draw do
  get '/', to: 'login#index'
  get '/list', to: 'service_list#index'
  get '/service/:id', to: 'service#index'
  get '/transaction', to: 'transaction#index'
  get 'viewtable/:id/:tid', to: 'viewtable#index'

  resources :changes, only: [:index, :new, :create]

  get '/users', to: 'accounts#index'
  post '/users', to: 'accounts#create'
  put '/users', to: 'accounts#update'
  delete '/users', to: 'accounts#destroy'
  put '/users/edit', to: 'accounts#edit'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
