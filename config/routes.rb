Rails.application.routes.draw do
  scope "(:locale)", locale: /#{BaseAxeonsoft[:langs].join('|')}/ do

    post 'home/custom_design'
    root to: 'home#index'
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
    get 'custom_design_page', to: "custom_design_page#index"
    resources :categories do
      collection do
        get 'show_product/:id', to: "categories#show_product", as: "show_product"
      end
    end

    resources :users, only: [:show]
    resources :products
    resources :pages
    resources :settings
    resources :subscribe_users
    resources :components do
      collection do
        get 'update_position/:id', to: "components#update_position", as: "update_position"
      end
    end

    # get "confirmation_order/:id", to: "pdf#confirmation_order"
    get '*path', to: 'exceptions#not_found'
    # Rails expects the error pages to be served from /<error code>.
    match '400', to: 'exceptions#not_found', via: :all
  end
end
