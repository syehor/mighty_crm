MightyCrm::Application.routes.draw do
  resources :events

  resources  :brands do 
    resources :car_models
  end

  devise_for :users
  root :to => "home#index"
end
