Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :vans do
    resources :bookings, only: %i[new create show]
  end
    resources :booking, only: %i[edit update destroy]
end
