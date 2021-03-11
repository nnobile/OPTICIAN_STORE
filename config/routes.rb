Rails.application.routes.draw do
  resources :opticians
  root 'sessions#home'
  get '/signup', to: 'opticians#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  resources :optometrists do
    resources :patients, only: [:create, :index, :new, :show]
  end
  get '/patients/abc', to: 'patients#abc'
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end