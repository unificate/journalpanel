Rails.application.routes.draw do
  get '/', to: 'login#index'

  # this will create:
  # GET /transaction --- display all saved transactions
  # POST /transaction --- create a new transaction; this is called from the changes#index form
  # GET /transaction/:id --- display all changes in a single transaction
  # DELETE /transaction/:id --- destroy a transaction, return changes to unbundled state
  resources :transaction, only: [:index, :create, :show, :destroy]
  # this is a custom route to push all changes in a transaction to the MicroManage engine
  post '/transaction/push', to: 'transaction#push'

  # this will create:
  # GET /microservice --- display all microservices
  # GET /microservice/:microservice_id/tables --- display all tables in a microservice
  # GET /microservice/:microservice_id/tables/:id --- display all rows in a table
  resources :microservices, only: [:index] do
    resources :tables, only: [:index, :show]
  end

  # this will create:
  # GET /changes --- display all changes
  # GET /changes/new --- display a form for creating a new change
  # POST /changes --- create and store a new change
  # DELETE /changes/:id --- destroy a stored change
  resources :changes, only: [:index, :new, :create, :destroy]
  # this is a custom route to push changes to the MicroManage engine
  post '/changes/push', to: 'changes#push'

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
