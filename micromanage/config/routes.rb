Micromanage::Engine.routes.draw do
  root "application#index"
  GET "/:table", to: "application#show"
  PUT "/:table/:row", to: "application:update"
end
