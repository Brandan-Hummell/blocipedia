Rails.application.routes.draw do
  resources :wikis

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: "home#index"
end
