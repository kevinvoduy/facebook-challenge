Rails.application.routes.draw do
  resources :fetcher

  root 'fetcher#index'
end
