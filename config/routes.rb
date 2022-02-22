Rails.application.routes.draw do
  devise_for :users
  root to: 'tas#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tas, only: [:index, :show] do
    resources :bookings, [:new, :create]
  end

  resources :users do
    resources :bookings, only: [:index]
  end

  resources :bookings, [:show, :destroy]
end
