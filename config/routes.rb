Rails.application.routes.draw do
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"

  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:index, :show]
end
