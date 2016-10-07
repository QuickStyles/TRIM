Rails.application.routes.draw do
  resources :index, only: [:index]
  root "statics#index"
end
