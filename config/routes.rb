Rails.application.routes.draw do
  resources :reading_lists
  devise_for :users
  root "pages#home"
  get "toys" => "pages#toys"
  get "blog" => "pages#blog"
  # get "reading-list" => "pages#reading_list"

  resources :posts, path: 'blog'
  resources :reading_lists, path: 'reading-list'
  
  get "get-hex", to: "hex_generators#get_hex"
end
