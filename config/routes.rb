Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resource :login
    resources :user
    resources :organization do
      resources :space do
        resources :reservation
      end
    end
  end

end
