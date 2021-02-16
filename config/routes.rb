Rails.application.routes.draw do
  root 'sessions#home'
  get '/signup', to: 'opticians#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :opticians
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
