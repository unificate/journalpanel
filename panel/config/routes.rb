Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/', to: 'login#index'
  get '/list', to: 'login#list'
  get '/admin_panel', to: 'login#admin_panel'
end
