Rails.application.routes.draw do
  devise_for :users
  resources :venues do
    resources :bookings
  end
end
