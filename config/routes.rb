Rails.application.routes.draw do

  get 'memberships/index'
  get 'memberships/show'
  get "/static_pages/user_page", to: "static_pages#user_page"
  post '/group/:id', action: :create_membership, controller: 'groups'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :articles, :groups, :memberships
  root to: "static_pages#home"
end
