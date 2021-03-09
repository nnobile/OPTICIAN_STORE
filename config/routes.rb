Rails.application.routes.draw do
  get '/patients/abc', to: 'patients#abc'
  resources :patients
  resources :optometrists
  root 'sessions#home'
  get '/signup', to: 'opticians#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  resources :opticians do
    resources :patients, only: [:create, :index, :new, :show]
    resources :optometrists, only: [:create, :new, :index]
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end