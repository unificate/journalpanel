Rails.application.routes.draw do
  get '/', to: 'login#index'
  get '/list', to: 'service_list#index'
  get '/service/:id', to: 'service#index'
  get '/transaction', to: 'transaction#index'
  get '/users', to: 'accounts#index'
  post '/users', to: 'accounts#create'
  put '/users', to: 'accounts#update'
  delete '/users', to: 'accounts#destroy'
  put '/users/edit', to: 'accounts#edit'
  get '/changes', to: 'changes#index'
  post '/changes', to: 'changes#create'
  get '/changes/:id/:table/:rowid', to: 'changes#show'
  post '/changes/submit', to: 'changes#submit'
  get 'viewtable/:id/:tid', to: 'viewtable#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
