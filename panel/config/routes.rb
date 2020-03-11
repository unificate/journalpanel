Rails.application.routes.draw do
  get '/', to: 'login#index'
  get '/list', to: 'service_list#index'
  get '/service/:id', to: 'service#index'
  get '/users', to: 'accounts#index'

  post '/users', to: 'accounts#create'

  put '/users', to: 'accounts#update'
  get '/edit/:id/:table/:rowid', to: 'editpage#index'
  post '/edit/submit', to: 'editpage#submit'
  get 'viewtable/:id', to: 'viewtable#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
