Rails.application.routes.draw do
  devise_for :users
  root  "items#index"
  resources :items
  get 'items/:price', to: 'items#new'

end
