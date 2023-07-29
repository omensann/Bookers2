Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only:[:show, :index, :edit]
  get '/homes/about' => "homes#about", as: "about"
  root to: "homes#top", as: "top"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
