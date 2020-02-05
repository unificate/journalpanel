Grabber::Engine.routes.draw do
    root "application#index"
    get '/:id', to: 'application#show'
end
