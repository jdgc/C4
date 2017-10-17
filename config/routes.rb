Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
