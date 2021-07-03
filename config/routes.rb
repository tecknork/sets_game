# frozen_string_literal: true

Rails.application.routes.draw do
  #devise_for :users
  resources :games
  resources :cards
  resources :sessions, only: [:create,:destroy]
  get '/games/:game_id/draw', to: 'games#draw'
  post '/games/:game_id/set',  to: 'games#set'
  get '/games/:game_id/set', to: 'games#set_all'
  # namespace :api , path:'/' , constraints: {subdomain :'api'} do
  #   resources :cards #, constraints: { subdomain : 'api'}
  # end
  # resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
