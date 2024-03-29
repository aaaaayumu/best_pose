Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  root to: 'posings#index'
  resources :posings do
    resources :comments, only: [:create, :edit, :update, :destroy] do
      resources :likes, only: [:create, :destroy] 
    end
  end
end
