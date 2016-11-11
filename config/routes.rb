Rails.application.routes.draw do
  get 'subreddits/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subreddits, only: [:index]

  root 'subreddits#index'
end
