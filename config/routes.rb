Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "toys" => "pages#toys"
  get "blog" => "pages#blog"

  resources :posts, path: 'blog'
  
  get "get-hex", to: "hex_generators#get_hex"
end
