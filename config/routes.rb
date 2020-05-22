Rails.application.routes.draw do

  get "/static_pages/user_page", to: "static_pages#user_page"

  devise_for :users
  resources :articles
  root to: "static_pages#home"
end
