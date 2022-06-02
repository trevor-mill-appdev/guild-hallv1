Rails.application.routes.draw do
  root "users#show"

  get ":username/inbox" => "inbox#show", as: :inbox
  get "home" => "users#show", as: :user
 
  devise_for :users

  resources :bulletins
  resources :proposals
  resources :votes
  resources :guilds
  resources :stashes
  resources :mobs
  resources :raiders
  resources :materials
  resources :users, only: :show
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
