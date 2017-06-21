Rails.application.routes.draw do


root 'top#index'

scope "/:locale", locale: /en|ja/   do

  get '' => 'top#index', as: 'top'
  get 'porter' => 'porter#top', as: 'porter_top'
  get 'help' => 'help#index', as: 'help_index'
  get 'inbox' => 'inbox#index', as: "inbox_index"
  get 'inbox/:id' => 'inbox#show', as: "inbox_personal"

  resources :messageboxes, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :demandposts

  resources :users, only: [:show, :edit, :update]

  # devise_scope :user do
  #   delete :sign_out, to: 'devise/session#destroy', as: :destroy_user_session
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

  devise_for :users,  controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  # , skip: [:session, :registrations]
  # devise_scope :user do
  #   post "/users/sign_in",    :to => "devise/sessions#create",   :as => 'user_session'
  #   delete "/users/sign_out", :to => "devise/sessions#destroy",  :as => 'destroy_session'
  #   get "/users/edit",        :to => "devise/registrations#edit",  :as => 'edit_user_registration'
  #   put "/users/edit",        :to => "devise/registrations#update",  :as => 'user_registration'
  #   delete "/users/edit",     :to => "devise/registrations#destroy",  :as => nil
  #   post "/users/edit",       :to => "devise/registrations#create",  :as => nil
  # end
  post 'itinerary/create' => 'itinerary#create', as: "itineraries"


end
