Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :podcasts, only: [:show, :edit, :update, :create, :new]

  resources :episodes, only: [:edit, :update, :create, :new, :destroy] do
    patch :go_live
  end

  resources :help, only: [:index]

  resources :users, only: [:show]
end
