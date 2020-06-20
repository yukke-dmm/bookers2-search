Rails.application.routes.draw do
  devise_for :users
  
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only:[:create, :destroy]
    get :follows, on: :member
    get :followers,on: :member
  end

  resources :books,only: [:new, :create, :index, :show, :edit, :update, :delete] do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments,only: [:create, :destroy]
  end

  root 'home#top'
  get 'home/about'
end