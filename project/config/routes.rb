Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root 'admin_page#login' #The application's landing page	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
