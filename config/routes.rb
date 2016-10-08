Rails.application.routes.draw do
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :providers, only: [:new, :create]

  resources :customers, only: [:new, :create]
  root "statics#index"
end
