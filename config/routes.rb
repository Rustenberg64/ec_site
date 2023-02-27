Rails.application.routes.draw do
  devise_for :customers
  root 'static_pages#home'
  get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
