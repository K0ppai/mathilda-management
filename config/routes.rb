Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :teachers, only: %i[index create update]
  resources :students, only: %i[index create update]
  resources :subjects, only: %i[index create update]
  resources :mathilda_classes, only: %i[index create]
  post '/login', to: 'auth#login'
  get '/me', to: 'auth#me'
end
