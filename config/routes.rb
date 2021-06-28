Rails.application.routes.draw do
  resources :cards, only :[:index,:show]
  # namespace :api , path:'/' , constraints: {subdomain :'api'} do 
  #   resources :cards #, constraints: { subdomain : 'api'}
  # end
  #resources :cards 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
