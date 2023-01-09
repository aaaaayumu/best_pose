Rails.application.routes.draw do
  devise_for :users
  root to: 'posings#index'
  resources :posings, only: [:new, :create, :show, :edit, :update] do
    resources :comments, only: :create
  end
end
