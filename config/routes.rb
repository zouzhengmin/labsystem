Rails.application.routes.draw do
  resources :samples
  resources :results
  resources :items

  root 'results#index'
end
