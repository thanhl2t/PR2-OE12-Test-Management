Rails.application.routes.draw do
  root "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only =>[:show]

  resources :user do
    get "/signin", to: "devise/sessions#new"
    post "/signin", to: "devise/sessions#create"
    delete "/signout", to: "devise/sessions#destroy"
  end

  resources :sessionexams do
    get "sessionexams/index"
    get "sessionexams/show"
    get "sessionexams/new"
    get "sessionexams/edit"
  end

  resources :exams do
    get "exams/index"
    get "exams/show"
    get "exams/new"
    get "exams/edit"
  end

  resources :questionbanks do
    get "questionbanks/index"
    get "questionbanks/show"
    get "questionbank/snew"
    get "questionbanks/edit"
  end

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'users/omniauth_callbacks#upgrade'
    get '/users/auth/:provider/setup', :to => 'users/omniauth_callbacks#setup'
  end

  match "/main", to: "main#index", via: "get"
  match "/users", to: "users#index", via: "get"
  match "/users/:id", to: "users#show", via: "get"
end
