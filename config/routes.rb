Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "about" => "pages#about"
  get "blog" => "pages#blog"

  resources :posts
  
  get "get-hex", to: "hex_generators#get_hex"
end
