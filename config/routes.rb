Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  
  resources :books, only: [:create,:index, :edit, :show, :update, :destroy,]
  resources :users, only: [:show, :index, :edit, :update]
  
  get "home/about" =>"homes#about",as:"about"
end
