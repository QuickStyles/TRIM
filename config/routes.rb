Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :providers, only: [:index, :new, :create]

  resources :services, shallow: true, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:show, :new, :create] do
      resources :payments, only: [:new, :create]
      resources :reviews, only: [:new, :create]
    end
  end
  resources :bookings, only: [:index]

  resources :customers, only: [:index, :show, :new, :create]

  get "/auth/google_oauth2", as: :sign_in_with_google
  get "/auth/:provider/callback" => "callbacks#google_oauth2_response"
  root "statics#index"
end
