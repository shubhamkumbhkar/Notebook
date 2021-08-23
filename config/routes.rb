Rails.application.routes.draw do
  root to: 'profiles#index'
  devise_for :users 
  

  devise_scope :user do
    resources :profiles
    get 'users/sign_out', to: 'devise/sessions#destroy'
    get 'sessions/new.user', to: 'devise/sessions#new'
  end
  
  resources :notes do
    resources :comments do 
      resources :replies
    end
  end
  
end
