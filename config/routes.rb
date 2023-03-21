Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], controllers: {
    sessions: "admins/sessions"
  }
  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations"
  }
  root 'static_pages#home'
  get 'about', to: "static_pages#about"

  namespace :admin do
    resources :products
  end

  scope module: :customer do
    resources :products, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
