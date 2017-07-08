Rails.application.routes.draw do
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"

  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  resources :posts do
    resources :comments
  end
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :tags, only: :show
end
