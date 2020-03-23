Rails.application.routes.draw do
  resources :notes
  resources :folders
  resources :users
    post '/login', to: 'auth#login'
    post '/signup', to: 'users#create'
    get '/profile', to: 'users#profile'
    patch '/profile', to:"users#profile"
end
