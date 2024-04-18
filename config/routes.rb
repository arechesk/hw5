# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :welcomes
    root 'welcomes#index'
  end
  resources :users
  resources :orders do
    get 'first', on: :collection
    member do
      get 'approve'
    end
  end

  root 'orders#calc'
  get 'my_last_order', to: 'orders#last'
  get 'vm/:id', to: 'orders#show'
  match 'orders', to: 'orders#show', via: %i[get delete]

  get 'hello/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
