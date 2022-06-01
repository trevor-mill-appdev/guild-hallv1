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
  root "guilds#index"

  get ":username/inbox" => "inbox#show", as: :inbox
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
