# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  
  get 'contacts/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  root to: 'pages#home'
  get 'kontakt', to: 'pages#contact', as: :contact
  
  resources :inquiries, :path => 'anfragen'
  resources :contacts, only: [:new, :create], :path => 'kontakt' 
  resources :articles, :path => 'artikel'

  resources :obituaries, only: [:new, :create, :index], :path => 'traueranzeigen'

  get '/:friendly_id', to: 'obituaries#show', as: :obituary
  get '/:friendly_id/edit', to: 'obituaries#edit', as: :edit_obituary
  patch '/:friendly_id', to: 'obituaries#update'
  delete '/:friendly_id', to: 'obituaries#destroy'

end
