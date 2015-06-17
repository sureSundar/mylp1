Rails.application.routes.draw do
  resources :testmigs
  get 'images/download'

  resources :images
  resources :regions
  resources :payoffs
  resources :images do
    member do
      get 'download'
    end
  end
    
  resources :projects
  resources :hpusers
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
