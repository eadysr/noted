Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :books, only: [:index, :new, :create]
    member do
      get :list, :add, :accept, :decline, :remove, :friends
    end
  end
  resources :books, only: [:destroy]
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
