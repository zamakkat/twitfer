require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :customers, only: [:index, :show]
  resources :tweets, only: [:index]

  mount Sidekiq::Web => '/monitor'
end
