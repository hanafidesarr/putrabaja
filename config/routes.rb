Rails.application.routes.draw do
  get 'home/index'
  post 'home/custom_design'
  root to: 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'custom_design_page', to: "custom_design_page#index"
end
