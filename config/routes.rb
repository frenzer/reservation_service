Rails.application.routes.draw do
  resources :hotels
  resources :rooms, only: :show do
    member do
      get :reserve
      get :cancel_reservation
    end
  end

  root 'hotels#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
