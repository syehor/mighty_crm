MightyCrm::Application.routes.draw do
  resources  :brands do 
    resources :car_models
  end

  devise_for :users
  root :to => "home#index"
end
