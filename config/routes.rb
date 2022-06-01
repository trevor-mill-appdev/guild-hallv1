Rails.application.routes.draw do
  devise_for :users

  resources :bulletins
  resources :proposals
  resources :votes
  resources :guilds
  resources :stashes
  resources :mobs
  resources :raiders
  resources :materials
  resources :users
  root "landing#show"

  get ":username/inbox" => "inbox#show", as: :inbox
  get ":username/home" => "landing#show", as: :landing
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
