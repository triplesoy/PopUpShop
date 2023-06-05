Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'venues/index'
  get 'venues/show'
  get 'venues/new'
  get 'venues/create'
  get 'venues/edit'
  get 'venues/update'
  get 'venues/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
