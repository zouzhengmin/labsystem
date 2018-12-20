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

  namespace :admin do
    resources :samples do
      collection do
        get :history
      end
    end
    root 'sessions#new'
    resources :sessions
    resources :categories
    resources :templates
    resources :items
    resources :template_values
  end



end
