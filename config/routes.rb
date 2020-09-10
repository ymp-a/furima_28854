Rails.application.routes.draw do
  devise_for :users
  root  "items#index"
  resources :items do
    resources :deals, only: [:index, :create]
  end
  get 'items/:price', to: 'items#new'

end
