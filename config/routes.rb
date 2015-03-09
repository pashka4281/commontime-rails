Rails.application.routes.draw do

  get 'login', to: 'sessions#new', as: :new_session
  post 'login', to: 'sessions#create', as: :session
  get 'logout', to: 'sessions#destroy', as: :destroy_session

  root to: 'home#index'
end
