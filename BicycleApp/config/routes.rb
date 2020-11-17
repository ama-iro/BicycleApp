Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  get 'users/index'
  devise_for :users, controllers: {
       registrations: 'users/registrations',
       sessions: 'users/sessions'
  }
  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
 end
