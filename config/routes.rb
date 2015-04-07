Rails.application.routes.draw do

  devise_for :users
  get "/members", to: "participants#members"
  resources :shows do
    resources :plays do
      resources :performances
    end
  end
  resources :participants, except: [:destroy]
  resources :users

  get "/plays", to: "plays#index"

  root 'shows#index'
end
