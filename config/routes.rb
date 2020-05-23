Rails.application.routes.draw do

  get "/static_pages/user_page", to: "static_pages#user_page"

  devise_for :users
  resources :articles, :groups
  root to: "static_pages#home"
end
