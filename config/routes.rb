Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :games do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
