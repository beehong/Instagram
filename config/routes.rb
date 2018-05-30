Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

##sign_in, sign_up, sign out
get "/sign_up" => "users#new"
post "/sign_up" => "users#create"
get "/sign_in" => "sessions#new"
post "/sign_in" => "sessions#create"
delete "/logout" => "sessions#destroy"


##post
get "/newpost" => "posts#new"
post "/newpost" => "posts#create"
get "/index" => "posts#index"
get "/post/:id/edit" => "posts#edit"
post "/post/:id/edit" => "posts#update"
delete "/post/:id" => "posts#destroy"
get "/post/:id/like" => "posts#like"

##comment
get "/post/:id/comment" => "comments#new"
post "/post/:id/comment" => "users#create"


##admin
delete "/user/:id/delete" => "users#destroy"
get "/admin_index" => "users#index"
post "/admin_search" => "users#search"
get "/admin_search" => "users#index"

##follow
get "/user/:id" => "follows#follower"
post "/search" => "follows#search"
get "/search" => "follows#search"

root to: "home#index"
end
