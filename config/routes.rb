Rails.application.routes.draw do
  resources :subjects, only: %i[create update]
  resources :mathilda_classes, only: %i[index]
  resources :teachers, only: %i[create update]
  resources :students, only: %i[create update]
  post '/login', to: 'auth#login'
end
