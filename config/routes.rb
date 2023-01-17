Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  
  resources :books, only: [:create,:index, :edit, :show, :update, :destroy]do
   resources:book_comments,only:[:create, :destroy]
   resource :favorites, only: [:create, :destroy]
end
  resources :users, only: [:show, :index, :edit, :update]
  
  get "home/about" =>"homes#about",as:"about"
end
