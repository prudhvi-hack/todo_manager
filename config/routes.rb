Rails.application.routes.draw do
  #get "todos", to: "todos#index"
  #post "todos", to: "todos#create"
  #get "todos/:id", to: "todos#show"
  resources :todos
  resources :users
  get "/", to: "home#index"
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
