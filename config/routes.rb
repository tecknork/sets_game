Rails.application.routes.draw do
  resources :games
  resources :cards
  # namespace :api , path:'/' , constraints: {subdomain :'api'} do 
  #   resources :cards #, constraints: { subdomain : 'api'}
  # end
  #resources :cards 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
