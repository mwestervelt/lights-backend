Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
        post '/login', to: 'auth#create'
      resources :user_emotions, only: [:create]
      resources :countries, only: [:index]
      resources :emotions, only: [:index]
      get '/profile', to: 'users#profile'

    end
  end
end
