Grabber::Engine.routes.draw do
    root "application#index"
    get '/:id', to: 'application#show'
    put '/:table/:row', to: 'application#update'
    get '/:table/:row', to: 'application#showRow'
end
