Rails.application.routes.draw do
  resources :samples do
    collection do
      get :history
    end
  end

  resources :templates
  resources :items
  resources :template_values

  root 'templates#index'
end
