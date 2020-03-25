Micromanage::Engine.routes.draw do
  root "application#index"
  get "/:table", to: "application#show"
  put "/:table/:row", to: "application#update"
  get "/:table/:row", to: "application#getrow"
  post "/:table", to: "application#create"
end
