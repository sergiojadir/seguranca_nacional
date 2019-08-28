Rails.application.routes.draw do
	namespace :api, defaults: { format: :json } do
    scope module: :v2, constraints: ApiConstraints.new(version: 2) do
      #
    end

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :tickets
		  resources :flights
		  resources :passengers
		  resources :aeroportos
    end
  end
end
