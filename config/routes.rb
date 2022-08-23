Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: "prototypes#index"
  # post 'tweets/new' => 'tweets#new'

  # resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # resources :comments, only: :create
  resources :users, only: :show
  resources :prototypes do
    resources :comments, only: :create
  end
  
end