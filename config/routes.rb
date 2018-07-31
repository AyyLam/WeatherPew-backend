Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :cities
      resources :forecasts
      resources :city_users
      resources :users
    end
  end
end
