MightyCrm::Application.routes.draw do
  resources :brands

  devise_for :users
  root :to => "home#index"
end
