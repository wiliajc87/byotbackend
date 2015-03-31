Rails.application.routes.draw do

  devise_for :users
  resources :shows, except: [:destroy]
  resources :plays, except: [:destroy]
  resources :performances, except: [:destroy]
  resources :participants, except: [:destroy]
  resources :users

  root 'application#index'
end
