Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :companies, only: [] do
        resources :jobs, only: [ :index ]
      end
    end
  end
end
