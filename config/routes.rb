Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :podcasts, only: [:show, :edit, :update, :create, :new]

  resources :episodes, only: [:edit, :update, :create, :new, :destroy]

  resources :help, only: [:index]
end
