Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :posts


end
