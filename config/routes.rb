Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'wines#index'
  get 'wines/index'
  get 'users/:id' => 'users#show'

  resources :wines, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    collection do
      get :wines
      get :postcomplete
      get :editcomplete
      get :deletecomplete
    end
      get :deletebefore, on: :member
  end
end