Rails.application.routes.draw do
  resources :books
  resources :users, only:[:show, :index, :edit]
  get '/homes/about' => "homes#about", as: "about"
  devise_for :users
  root to: "homes#top", as: "top"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
