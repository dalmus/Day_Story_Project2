Rails.application.routes.draw do
  root to: 'users#new'

  resources :posts do
  resources :comments
end

  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
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
