Rails.application.routes.draw do

  root 'top#index'

  get 'help' => 'help#index', as: 'help_index'

  get 'inbox' => 'inbox#index', as: "inbox_index"
  get 'inbox/:id' => 'inbox#show', as: "inbox_personal"

  resources :messageboxes
  resources :messages
  resources :demandposts

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users, only: [:show, :edit, :update]

  # devise_scope :user do
  #   delete :sign_out, to: 'devise/session#destroy', as: :destroy_user_session
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
