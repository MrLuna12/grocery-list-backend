Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  # API routes
  namespace :api do
    namespace :v1 do
      post 'auth/register', to: 'auth#register'
      post 'auth/login', to: 'auth#login'

      resources :grocery_lists do
        resources :items
      end
    end
  end
end
