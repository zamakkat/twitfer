require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  get '/customers', to: 'home#customers'

  mount Sidekiq::Web => '/sidekiq'
end
