Rails.application.routes.draw do
  get 'fetcher/index'

  resources :data

  root 'fetcher#index'
end
