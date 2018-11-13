Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :events
    resources :resources
    resources :supplies
    resources :discounts
  end

  get '/search', to: "home#search"
  resources :supplies, only: :index do
    resources :discounts, only: [:index, :show]
  end
  resources :events, only: [:show, :index]
  resources :resources, only: [:show, :index]
  resources :discounts, only: [:show, :index] do
    post "notify_about_discount", to: "discounts#notify_about_discount", as: :discounts_notify
  end
end
