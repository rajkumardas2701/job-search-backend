Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'sessions/new'
      get 'sessions/create'
      get 'sessions/destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
