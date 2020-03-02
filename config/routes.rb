Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :movies
  devise_for :users
  get 'home/index'

  get 'bookings/index/:movie_id', to: "bookings#index", as: :booking_home
  post 'bookings/create', to: "bookings#create"
  get 'bookings/invoice/:booking_id', to: "bookings#invoice", as: :bookings_invoice
  get "show_booked_seats", to: "bookings#show_booked_seats"
  match "export_report", to: "reports#export_report", via: [:get, :post]
  get "reports", to: "reports#index"

end
