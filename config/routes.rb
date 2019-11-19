Rails.application.routes.draw do
  post "/login", to: "users#login"
  post "/create-user", to: "users#create"
  get "/users/show", to: "users#show"
  resources :lists, only: [:create, :destroy]
  resources :to_dos, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
