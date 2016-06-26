require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :customers, only: [:index, :show]

  mount Sidekiq::Web => '/sidekiq'
end
