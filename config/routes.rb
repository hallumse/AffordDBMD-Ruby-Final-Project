Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :events
    resources :resources
    resources :supplies
  end
  resources :supplies, only: [:show, :index]
end
