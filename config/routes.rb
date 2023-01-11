Rails.application.routes.draw do
  devise_for :users
  root to: 'posings#index'
  resources :posings do
    resources :comments, only: :create
  end
end
