Rails.application.routes.draw do
  post "/login", to: "users#login"
  post "/create-user", to: "users#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
