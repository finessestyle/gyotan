Rails.application.routes.draw do  
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  get "users/:id/likes" => "users#likes"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "blogs" => "blogs#index"
  get "blogs/new" => "blogs#new"
  get "blogs/:id" => "blogs#show"
  post "blogs/create" => "blogs#create"
  get "blogs/:id/edit" => "blogss#edit"
  post "blogs/:id/update" => "blogs#update"
  post "blogs/:id/destroy" => "blogs#destroy"

  get "seasonal/spring" => "seasonal#spring"
  get "seasonal/summer" => "seasonal#summer"
  get "seasonal/autumn" => "seasonal#autumn"
  get "seasonal/winter" => "seasonal#winter"
  
  get "/" => "home#top"
  
end