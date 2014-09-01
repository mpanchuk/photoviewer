Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  resources :albums, only: [:index, :show]
  resources :comments, only: [:index, :create]

end