Rails.application.routes.draw do
  devise_for :users
  get 'contact', to: 'pages#contact', as: :contact

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
