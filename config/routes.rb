Rails.application.routes.draw do
  devise_for :engineers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  resources :todos
  resources :health_check, only: [:index]
  resources :experiment, only: [:index]
end
