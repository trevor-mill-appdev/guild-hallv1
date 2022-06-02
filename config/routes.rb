Rails.application.routes.draw do
  resources :warchests
  root "users#show"

  get "/inbox" => "users#inbox"
  get "/home" => "users#show"
  get "/stash" => "users#loot"
  get "/guild" => "guilds#show"
  get "/bulletin" => "guilds#bulletin"
  get "/proposals" => "guilds#props"
 
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
