Rails.application.routes.draw do
  resources :patients
  root 'sessions#home'
  get '/signup', to: 'opticians#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  resources :opticians do
    resources :patients, only: [:create, :index]
  end
  resources :optometrists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
