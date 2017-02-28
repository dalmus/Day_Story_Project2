Rails.application.routes.draw do

  resources :posts do
  resources :comments
end

  root to: 'users#new'

  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create'

  get '/login'     => 'sessions#new'
 post '/login'    => 'sessions#create'
 delete '/logout' => 'sessions#destroy'

#  get "posts/" => "posts#index"
# get "posts/new" => "posts#new", as: :new_post
# post "posts/" => "posts#create"
# get "posts/:id/edit" => "posts#edit", as: :edit_post
# patch "posts/:id" => "posts#update"
# get "posts/:id" => "posts#show", as: :post
# delete "posts/:id" => "posts#destroy"


end