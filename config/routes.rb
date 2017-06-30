Rails.application.routes.draw do
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
end
