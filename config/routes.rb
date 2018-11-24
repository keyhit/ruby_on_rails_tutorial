Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  resources :users do
    resources :microposts
  end
  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
