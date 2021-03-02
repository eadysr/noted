Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books
  resources :films
  resources :users, only: [:show, :edit, :update]
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
