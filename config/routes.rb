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
  get 'projects/select'
  resources :hpusers
  root to: 'visitors#index'
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users
end
