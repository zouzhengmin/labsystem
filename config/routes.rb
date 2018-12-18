Rails.application.routes.draw do

  root 'welcome#index'
  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :samples do
    collection do
      get :history
    end
  end

  resources :templates
  resources :items
  resources :template_values

end
