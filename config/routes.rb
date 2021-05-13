Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions, only: [:new, :create, :destroy]
      resources :jobs
      resources :apps  
      post 'signup', to: 'users#create', as: 'signup'
      post 'login', to: 'sessions#create', as: 'login'
      post 'logout', to: 'sessions#destroy', as: 'logout'
      get 'logged_in', to: 'sessions#is_logged_in?', as: 'logged_in'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
