# config/routes.rb

Rails.application.routes.draw do
  # ... other routes may be here

  namespace :api do
    namespace :v1 do
      resources :lessons, only: [:index, :show]
    end
  end
end
