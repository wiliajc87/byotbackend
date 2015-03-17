Rails.application.routes.draw do

  resources :shows, except: [:destroy]
  resources :plays, except: [:destroy]
  resources :performances, except: [:destroy]
  resources :participants, except: [:destroy]
  resources :users
  # resources :sessions

  root 'application#index'
end
