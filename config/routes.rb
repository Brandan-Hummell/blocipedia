Rails.application.routes.draw do
  
  resources :collaborators
  resources :wikis do
     resources :collaborators, only: [ :new, :create, :destroy ]
  end
  resources :charges, only: [ :new, :create ] do
    collection do
      put 'downgrade'
    end
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"
end
