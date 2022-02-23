Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create]
    collection do
      get :home
    end
  end
  resources :bookings, only: [:index, :show, :destroy]
end
