
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "pages/home"
  mount Ckeditor::Engine => '/ckeditor'
  
  # Notes routes with sharing
  resources :notes do
    post :share, on: :member
    collection do
      get :archived
    end
    member do
      patch :archive
      patch :unarchive
    end
  end

  # Devise authentication
  devise_for :users

  root "pages#home"

  resources :notes
  



  # Root route
  

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
