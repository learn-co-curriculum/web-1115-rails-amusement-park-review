Rails.application.routes.draw do

  resources :users
  resources :attractions do 
    post '/rides', to: "rides#create"
  end

 "/attractions/:id/rides"

  root "home#index"

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  delete '/signout', to: "sessions#destroy"

end