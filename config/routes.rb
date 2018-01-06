Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: "home#index"
end
