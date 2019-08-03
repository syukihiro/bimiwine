Rails.application.routes.draw do
  
  devise_for :users
  get '/wines/index'
  
end
