Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sessions/new'
      get 'sessions/create'
      get 'sessions/destroy'
      resources :users
      resources :sessions, only: [:new, :create, :destroy]  
      get 'signup', to: 'users#new', as: 'signup'
      get 'login', to: 'sessions#new', as: 'login'
      get 'logout', to: 'sessions#destroy', as: 'logout'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
