MightyCrm::Application.routes.draw do

  get "home/index"

  resources :users do
    get :user_autocomplete, :on => :collection
    resources :events
  end

  resources :events

  resources :service_types

  resources :car_models

  resources  :brands do 
    resources :car_models
  end

  devise_for :users
  root :to => "home#index"
end
