Rails.application.routes.draw do
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :providers, only: [:index, :new, :create]

  resources :services, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:index, :show, :new, :create]
  end

  resources :customers, only: [:index, :new, :create]

  get "/auth/google_oauth2", as: :sign_in_with_google
  get "/auth/google_oauth2/callback" => "callbacks#index"

  root "statics#index"
end
