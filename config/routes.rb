Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'wines#index'
  get 'wines/index'
  get 'users/:id' => 'users#show'
  
end