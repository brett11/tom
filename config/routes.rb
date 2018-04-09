Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/about',    to: 'static_pages#about'
  get  '/gallery',  to: 'static_pages#gallery'

  get '/contact', to: 'messages#new'
  post '/contact', to: 'messages#create'
end
