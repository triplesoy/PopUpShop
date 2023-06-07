Rails.application.routes.draw do
  devise_for :users
  root to: 'venues#index'
  resources :venues do
    resources :bookings
  end
  get "my_bookings", to: "bookings#my_bookings", as: :my_bookings
end
