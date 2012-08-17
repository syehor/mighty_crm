MightyCrm::Application.routes.draw do
  get "home/index"

  resources :service_types

  resources :events

  resources :car_models

  resources  :brands do 
    resources :car_models
  end

  devise_for :users
  root :to => "home#index"
end
