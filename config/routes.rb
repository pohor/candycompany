Rails.application.routes.draw do
  get 'users/show'
  get '/home', to: 'static_pages#home'
  get '/omnie', to: 'static_pages#omnie'
  get 'kontakt', to: 'static_pages#kontakt'
  get '/admin', to: 'static_pages#admin'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_for :users do
    get ':user/edit', to: 'devise/registration#edit'
  end
  resources :users

  resources :posts do
    resources :comments
    collection do
      match 'ransack' => 'posts#ransack', via: [:get, :post], as: :ransack
    end
    resources :hearts, only: %i[create destroy]
  end


  resources :workshops

  resources :ingredients

  resources :categories



end
