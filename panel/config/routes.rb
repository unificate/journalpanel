Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/', to: 'login#index'
  get '/list', to: 'service_list#index'
  get '/users', to: 'accounts#index'
  post '/users', to: 'accounts#create'	
end
