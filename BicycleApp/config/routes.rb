Rails.application.routes.draw do
  get 'notification/index'
  get 'users/show/:id', to: 'users#show'
  get 'users/new'
  get 'users/index'

  resources :posts
  resources :comments, only: [:create, :destroy]


  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
  get :top_page,     to: 'static_pages#top_page'

  devise_for :users, controllers: {
       registrations: 'users/registrations',
       sessions: 'users/sessions'
  }

  get :favorites, to: 'favorites#index'
  post   "favorites/:post_id/create"  => "favorites#create"
  delete "favorites/:post_id/destroy" => "favorites#destroy"

  devise_scope :user do
    delete 'users/:id' => 'users/registrations#destroy_user', as: :user_destroy
  end
 end
