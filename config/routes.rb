Rails.application.routes.draw do
  resources :users
  post "/signup", to: "users#create"
  post "/login", to: "auth#login"
end
