Rails.application.routes.draw do
  resources :providers, only: [:new, :create]
  root "statics#index"
end
