Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'wines#index'
  get 'wines/index'
  get 'users/:id' => 'users#show'

  resources :wines, only: [:new, :create, :show, :edit, :update] do
    collection do
      get :wines
      get :postcomplete
      get :deletecomplete
    end
  end
end