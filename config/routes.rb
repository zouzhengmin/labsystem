Rails.application.routes.draw do
  resources :samples
  resources :templates do
    collection do
      get :history
    end
  end
  resources :items
  resources :template_values

  root 'templates#index'
end
