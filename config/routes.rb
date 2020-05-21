# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :users do
    # Pretender Gem
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end
  
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

  get '/:friendly_id/text', to: 'obituaries#text', as: :obituary_text
  post '/:friendly_id', to: 'obituaries#destroy_text', as: :obituary_text_destroy

  get '/traueranzeigen/willkommen', to: 'obituaries#welcome', as: :obituary_welcome

  # Friendly Obituary_Memories
  get '/:friendly_id/erinnerungen', to: 'memories#index'
  get '/:friendly_id/erinnerungen/new', to: 'memories#new', as: :new_memory
  post '/:friendly_id/erinnerungen/new', to: 'memories#create'
  get '/:friendly_id/erinnerungen/show', to: 'memories#show', as: :memory
  get '/:friendly_id/erinnerungen/:id/edit', to: 'memories#edit', as: :edit_memory
  patch '/:friendly_id/erinnerungen/:id', to: 'memories#update', as: :update_memory
  delete '/:friendly_id/erinnerungen/:id', to: 'memories#destroy', as: :destroy_memory

end
