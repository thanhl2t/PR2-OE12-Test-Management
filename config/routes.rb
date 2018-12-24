Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  resources :user do
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    delete "signout", to: "devise/sessions#destroy"
  end

  resources :sessions do
    get "sessions/index"
    get "sessions/show"
    get "sessions/new"
    get "sessions/edit"
  end
end
