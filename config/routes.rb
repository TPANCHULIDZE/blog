Rails.application.routes.draw do
  root to: "home#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  delete "logout", to: "sessions#destroy"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"


  get "posts", to: "posts#index"
  get "user_posts", to: "posts#show"

  get "create_post", to: "create_posts#new"
  post "create_post", to: "create_posts#create"

  get "show_post", to: "show_posts#show"

  get "update_post", to: "update_posts#edit"
  patch "update_post", to: "update_posts#update"

  delete "delete_post", to: "destroy_posts#destroy"
  
end
