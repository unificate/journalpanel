Rails.application.routes.draw do
  mount Grabber::Engine => "/grabber"
end
