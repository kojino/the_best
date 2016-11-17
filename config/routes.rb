Rails.application.routes.draw do
  resources :subreddits, only: [:index, :new, :create, :show, :edit, :update] do
    resources :posts, only: [:new, :create, :edit, :update]
  end

  resources :posts, only: [:show] do
    resources :comments, only: [:new, :create, :edit, :update]
  end


  root 'subreddits#index'
end
