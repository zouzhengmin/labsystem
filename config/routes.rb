Rails.application.routes.draw do
  resources :samples
  resources :templates do
    collection do
      get :history
    end
  end
  resources :items

  root 'templates#index'
end
