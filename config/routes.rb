Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions, only: [:create, :destroy]
      resources :jobs
      resources :apps
      get 'logged_in', to: 'sessions#check_logged_in?', as: 'logged_in'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
