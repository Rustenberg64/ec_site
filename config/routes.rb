Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations], controllers: {
    sessions: "admins/sessions"
  }
  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations"
  }
  root 'static_pages#home'
  get 'static_pages/home'

  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
