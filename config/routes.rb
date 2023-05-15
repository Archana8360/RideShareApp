Rails.application.routes.draw do
  resources :rides
  resources :vehicles
  resources :infos
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :account_activations, only: [:edit,:create]
  get "ride/search",to: "rides#searchRide"
  get "ride/bookRide",to: "rides#bookRide"

  post "sendotp",to:"infos#sendotp"
  post "verifyotp",to:"infos#verifyotp"



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
