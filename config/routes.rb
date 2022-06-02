Rails.application.routes.draw do
  root "users#show"

  get "/inbox" => "users#inbox"
  get "/home" => "users#show"
  get "/stash" => "users#loot"
  get "/guild" => "guilds#show"
 
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
