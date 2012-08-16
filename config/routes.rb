MightyCrm::Application.routes.draw do
  resources :service_types

  resources :events

  resources  :brands do 
    resources :car_models
  end

  devise_for :users
  root :to => "home#index"
end
