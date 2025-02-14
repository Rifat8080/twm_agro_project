Rails.application.routes.draw do
  devise_for :users
  
  # Authenticated user root path
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end
  
  # Non-authenticated user root path (login page)
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
  get "dashboard/index"
end