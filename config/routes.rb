Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :vans do
    resources :bookings, only: %i[create show]
  end
    resources :bookings, only: [:index, :edit, :update, :destroy]
end
