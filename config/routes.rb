Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/warsztaty'
  get 'static_pages/omnie'
  get 'static_pages/kontakt'
  get 'static_pages/wspolpraca'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_for :users

  resources :posts

  resources :ingredients

  resources :categories

end
