Rails.application.routes.draw do
  get "search/index"
  root "search#index"
  namespace :api do
    namespace :v1 do
      resources :companies, only: [] do
        resources :jobs, only: [ :index ]
      end
    end
  end
end
