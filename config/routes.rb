Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'contact', to: 'pages#contact', as: :contact
  
  # MAUAL ROUTES NOT REQUIRED
  # get 'inquiries', to: 'inquiries#index', as: :inquiries
  # get 'inquiries/new', to: 'inquiries#new'
  # post 'inquiries', to: 'inquiries#create'
  # get 'inquiries/:id', to: 'inquiries#show'
  # get 'inquiries/:id/edit', to: 'inquiries#edit'
  # patch 'inquiries/:id', to: 'inquiries#update'
  # delete 'inquiries/:id', to: 'inquiries#destroy'
  resources :inquiries

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
