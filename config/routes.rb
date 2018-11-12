 Rails.application.routes.draw do

 get '/users', to: 'users#index'

 root 'products#index', as: '/'

 get '/home', to: 'home#home'

 #match ':controller(/:action(/:id))', :via => [:get, :post]

 resources :users

 resources :sessions

end