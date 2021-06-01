Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :leagues do
        resources :seasons, only: [:create, :update, :destroy]
      end

      resources :seasons, only: [:show] do
        resources :teams
      end
    end
  end
end
