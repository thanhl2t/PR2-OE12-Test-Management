Rails.application.routes.draw do
  root "index#index"
  devise_for :users

  resources :user do
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    delete "signout", to: "devise/sessions#destroy"
  end

end
