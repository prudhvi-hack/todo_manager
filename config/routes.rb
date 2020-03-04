Rails.application.routes.draw do
  #get "todos", to: "todos#index"
  #post "todos/create", to: "todos#create"
  #get "todos", to: "todos#show"
  resources :todos
end
