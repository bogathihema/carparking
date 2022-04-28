Rails.application.routes.draw do
  root to: 'bookingslots#index'
  resources :bookingslots do
    get :vehicle_history, on: :collection
    get :get_vehicle_slots, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
