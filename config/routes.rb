Rails.application.routes.draw do
  get 'rooms/index'
  resources :rooms do
    collection do
      get 'list'
      get 'search' => 'rooms#search'
    end
  end
  root 'rooms#index'
  
  get 'rooms/search' => 'rooms#search'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  devise_scope :users do
    get 'users/index'
    get 'users/show'
    get 'users/profile' => "users#edit"
    get 'users/profile_create' => "users#update"
    post 'users/profile_create' => "users#update"
    patch 'users/profile', to: 'users#update'
  end
  
  resources :reservations do 
    get "reservations/:id" => "reservations#show"
    collection do
      post :new, path: :new, as: :new, action: :back
      post "confirm"
    end
  end
end
