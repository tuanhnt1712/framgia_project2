Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get 'tags/:tag', to: 'posts#index', as: "tag"

  devise_for :users
  resources :posts
end
