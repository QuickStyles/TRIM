Rails.application.routes.draw do
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :providers, only: [:index, :new, :create]
  resources :services, only: [:index, :show, :new, :create]

  resources :customers, only: [:index, :new, :create]
  root "statics#index"
end
