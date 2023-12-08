Rails.application.routes.draw do
  resources :teachers
  resources :students
  resources :users
  post "/signup", to: "users#create"
  post "/login", to: "auth#login"
end
