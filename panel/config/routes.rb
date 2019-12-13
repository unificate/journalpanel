Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get '/', to: 'login#index'
  get '/list', to: 'service_list#index'
  get '/service/:id', to: 'service#index'
  get '/users', to: 'accounts#index'
  
end
