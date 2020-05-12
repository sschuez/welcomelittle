# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  root to: 'pages#home'
  get 'kontakt', to: 'pages#contact', as: :contact
  resources :contacts, only: [:new, :create], :path => 'kontakt' 
  # get 'contacts/new'
  
  resources :articles, :path => 'artikel'
  resources :inquiries, :path => 'anfragen'


  # Friendly Obituaries
  resources :obituaries, only: [:new, :create, :index], :path => 'traueranzeigen'
  get '/:friendly_id', to: 'obituaries#show', as: :obituary
  get '/:friendly_id/edit', to: 'obituaries#edit', as: :edit_obituary
  patch '/:friendly_id', to: 'obituaries#update'
  delete '/:friendly_id', to: 'obituaries#destroy'

  # Friendly Obituary_Memories
  get '/:friendly_id/erinnerungen', to: 'memories#index'
  get '/:friendly_id/erinnerungen/new', to: 'memories#new', as: :new_memory
  post '/:friendly_id/erinnerungen', to: 'memories#create'
  get '/:friendly_id/erinnerungen/show', to: 'memories#show', as: :memory
  get '/:friendly_id/erinnerungen/edit', to: 'memories#edit', as: :edit_memory
  patch '/:friendly_id/erinnerungen', to: 'memories#update'
  delete '/:friendly_id/erinnerungen', to: 'memories#destroy'

end
