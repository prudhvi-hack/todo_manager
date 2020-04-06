Rails.application.routes.draw do
  #get "todos", to: "todos#index"
  #post "todos", to: "todos#create"
  #get "todos/:id", to: "todos#show"
  resources :todos
  get "todos/all", to: "todos#all"
  post "users/:id/login", to: "users#check"
  resources :users
end
