Rails.application.routes.draw do
  resources :tickets
  resources :flights
  resources :passengers
  resources :aeroportos
end
