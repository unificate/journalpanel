Micromanage::Engine.routes.draw do
  # GET /micromanage --- return all tables with schemas
  root "application#index"

  # GET /micromanage/:table --- return all records in :table
  get "/:table", to: "application#show"

  # GET /micromanage/:table/:row --- return a single record from table
  get "/:table/:row", to: "application#getrow"

  # PUT /micromanage/:table/:row --- update a record in :table
  put "/:table/:row", to: "application#update"

  # POST /:table --- create a new record in :table
  post "/:table", to: "application#create"
end
