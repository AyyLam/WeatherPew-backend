Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :cities
      get '/cities/:id', to: 'cities#show', as: 'london'
      resources :forecasts
    end
  end
end
