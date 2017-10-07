Rails.application.routes.draw do
  resources :hotels
  resources :rooms, only: :show

  root 'hotels#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
