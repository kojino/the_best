Rails.application.routes.draw do

  # resources :users, only: [] do
  #   resources :subreddits, only[]
  # end
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :subreddits, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts, only: [:show] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  root 'subreddits#index'
end
