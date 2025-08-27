Rails.application.routes.draw do
  get "alerts/create"
  get "alerts/unsubscribe"
  get "search/index"
  root "search#index"

  resources :alerts , only: [ :create ] do
    get :unsubscribe, on: :member
  end
  namespace :api do
    namespace :v1 do
        resources :companies, only: [], param: :name do
        resources :jobs, only: [ :index ]
      end
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    mount GoodJob::Engine => 'good_job'
  end
end
