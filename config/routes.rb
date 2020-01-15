Rails.application.routes.draw do
  devise_for :companies, controllers: {
    sessions: 'companies/sessions',
    passwords: 'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :engineers, controllers: {
    sessions: 'engineers/sessions',
    passwords: 'engineers/passwords',
    registrations: 'engineers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  resources :todos
  resources :health_check, only: [:index]
  resources :experiment, only: [:index]
end
