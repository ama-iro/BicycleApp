Rails.application.routes.draw do
  get 'users/show/:id', to: 'users#show'
  get 'users/new'
  get 'users/index'

  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'

  devise_for :users, controllers: {
       registrations: 'users/registrations',
       sessions: 'users/sessions'
  }

  devise_scope :user do
    delete 'users/:id' => 'users/registrations#destroy_user', as: :user_destroy
  end
 end
