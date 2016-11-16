Rails.application.routes.draw do
  get 'subreddits/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subreddits, only: [:index, :new, :create, :show, :edit, :update] do
    resources :posts, only: [:new, :create, :edit, :update]
  end


  root 'subreddits#index'
end
