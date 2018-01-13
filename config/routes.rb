Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [ :new, :create ] do
    collection do
      put 'downgrade'
    end
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"
end
