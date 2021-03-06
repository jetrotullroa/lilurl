Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :links, only: [:index, :new, :create]

  get '/:short_link' => 'links#show'

  mount API::Base, at: "/"

  root 'links#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
