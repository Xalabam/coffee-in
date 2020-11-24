Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :coupons, only: [:index, :show, :create, :destroy]

  get "/users/id/coupons", to: "coupons#my_coupons", as: 'my_coupons'

  resources :claims, only: [:index, :create, :destroy]
end
