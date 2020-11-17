Rails.application.routes.draw do
  # get 'vans/index'
  # get 'vans/new'
  # get 'vans/create'
  # get 'vans/update'
  # get 'vans/edit'
  # get 'vans/destroy'
  # get 'vans/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
