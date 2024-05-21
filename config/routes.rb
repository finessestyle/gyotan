Rails.application.routes.draw do
  get "/", to: "home#top"
  get "about", to: "home#about"

  post "users/:id/update", to: "users#update"
  patch "users/:id/update", to: "users#update"
  get "users/:id/edit", to: "users#edit"
  get "signup", to: "users#new"
  post "users/create", to: "users#create"
  get "users/index", to: "users#index"
  get "users/:id", to: "users#show"
  post "login", to: "users#login"
  post "logout", to: "users#logout"
  get "login", to: "users#login_form"
  get "users/:id/likes", to: "users#likes"
  delete "users/:id", to: 'users#destroy', as: 'delete_user'

  get "posts/index", to: "posts#index"
  get "posts/new", to: "posts#new"
  get "posts/:id", to: "posts#show"
  post "posts/create", to: "posts#create"
  get "posts/:id/edit", to: "posts#edit"
  post "posts/:id/update", to: "posts#update"
  patch "posts/:id/update", to: "posts#update"
  post "posts/:id/destroy", to: "posts#destroy"

  get "blogs/index", to:  "blogs#index"
  get "blogs/new", to: "blogs#new"
  get "blogs/:id", to: "blogs#show"
  post "blogs/create", to: "blogs#create"
  get "blogs/:id/edit", to: "blogs#edit"
  post "blogs/:id/update", to: "blogs#update"
  patch "blogs/:id/update", to: "blogs#update"
  post "blogs/:id/destroy", to: "blogs#destroy"

  get "maps/index", to: "maps#index"
  get "maps/new", to: "maps#new"
  get "maps/:id", to: "maps#show"
  post "maps/create", to: "maps#create"
  get "maps/:id/edit", to: "maps#edit"
  post "maps/:id/update", to: "maps#update"
  patch "maps/:id/update", to: "maps#update"
  post "maps/:id/destroy", to: "maps#destroy"

  post "likes/:post_id/create", to: "likes#create"
  post "likes/:post_id/destroy", to: "likes#destroy"

  get "term", to: "home#term"
  get "privacy", to: "home#privacy"
  get "cookie", to: "home#cookie"
  get "rule", to: "home#rule"

  get "contacts/new", to: "contacts#new"
  post "contacts/create", to: "contacts#create"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  # ネストさせる
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end

end
