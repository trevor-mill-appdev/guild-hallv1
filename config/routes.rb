Rails.application.routes.draw do
  resources :bulletins
  resources :proposals
  resources :votes
  resources :guilds
  resources :stashes
  resources :mobs
  resources :raiders
  resources :materials
  devise_for :users
  root "guilds#index"

  get ":username" => "users#show", as: :user
  get ":username/inbox" "users#inbox", as: :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
