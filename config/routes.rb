Rails.application.routes.draw do
  get 'contacts/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'contact', to: 'pages#contact', as: :contact
  # get 'articles', to: 'pages#articles', as: :articles
  
  resources :inquiries
  resources :contacts, only: [:new, :create]
  resources :articles


  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
