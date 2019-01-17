Rails.application.routes.draw do
  get 'favorites/update'
  get 'users/show'
  get '/home', to: 'static_pages#home'
  get '/omnie', to: 'static_pages#omnie'
  get 'kontakt', to: 'static_pages#kontakt'
  get '/wspolpraca', to: 'static_pages#wspolpraca'
  get '/admin', to: 'static_pages#admin'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_for :users do
    get ':user/edit', to: 'devise/registration#edit'
  end

  resources :users

  resources :posts

  resources :workshops

  resources :ingredients

  resources :categories



end
