Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/dashboard', to: 'pages#dashboard'

  post 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  post 'bookings/:id/deny', to: 'bookings#deny', as: :deny_booking

  resources :dojo_spaces do
    resources :bookings, except: %i[edit destroy] do
      resources :reviews, only: %i[create]
    end
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
