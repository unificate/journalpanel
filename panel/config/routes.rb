Rails.application.routes.draw do
  get 'service_list/service_list'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/', to: 'login#index'
  get '/list', to: 'login#list'
  get '/users', to: 'accounts#index'
  post '/users', to: 'accounts#create'	
end
