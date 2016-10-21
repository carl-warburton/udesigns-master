Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :roles
  resources :user_profiles

  root "user_profiles#index"
  # get "home/index", to: 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :charges

  resources :conversations do
    resources :messages
  end

end
