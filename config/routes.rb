Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :coupons, only: [:index, :show, :create, :destroy]
      get "/users/id/coupons", to: "coupons#my_coupons", as: 'my_coupons'
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :claims, only: [:index, :create, :destroy]
    end
  end

  post '/login', to: 'login#login'
end
