Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do
    resources :books, only: [:index, :show, :new, :create, :edit, :update, :delete]
    member do
      get :list
    end
  end
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
