Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  resources :articles, except: :index do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:edit, :update, :show]
end