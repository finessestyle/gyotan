Rails.application.routes.draw do    
  
  post "likes/:post_id/create", to: "likes#create"
  post "likes/:post_id/destroy", to: "likes#destroy"

  get "users/:id/update", to: "users#update"
  post "users/:id/update", to: "users#update"
  get "users/:id/edit", to: "users#edit"
  post "users/create", to: "users#create"
  get "signup", to: "users#new"
  get "users/index", to: "users#index"
  get "users/:id", to: "users#show"
  post "login", to: "users#login"
  post "logout", to: "users#logout"
  get "login", to: "users#login_form"
  post "users/:id/likes", to: "users#likes"

  get "posts/index", to: "posts#index"
  get "posts/new", to: "posts#new"
  get "posts/:id", to: "posts#show"
  post "posts/create", to: "posts#create"
  get "posts/:id/edit", to: "posts#edit"
  get "posts/:id/update", to: "posts#update"
  post "posts/:id/update", to: "posts#update"
  post "posts/:id/destroy", to: "posts#destroy"

  get "blogs", to:  "blogs#index"
  get "blogs/new", to: "blogs#new"
  get "blogs/:id", to: "blogs#show"
  post "blogs/create", to: "blogs#create"
  get "blogs/:id/edit", to: "blogs#edit"
  post "blogs/:id/update", to: "blogs#update"
  patch "blogs/:id/update", to: "blogs#update"
  post "blogs/:id/destroy", to: "blogs#destroy"

  get "maps", to:  "maps#index"
  get "maps/new", to: "maps#new"
  get "maps/:id", to: "maps#show"
  post "maps/create", to: "maps#create"
  get "maps/:id/edit", to: "maps#edit"
  post "maps/:id/update", to: "maps#update"
  patch "maps/:id/update", to: "maps#update"
  post "maps/:id/destroy", to: "maps#destroy"

  get "seasonal", to: "seasonal#seasonal"
  
  get "/", to: "home#top"
  get "home/show", to: "home#show"
end