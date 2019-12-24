Rails.application.routes.draw do
  root to: 'maps#root'
  get 'maps/select' => 'maps#show'
  post 'reviews/count'
  post 'maps/authenticate'
  resources :maps do
    resources :sites do
      resources :comments do
      end
    end
  end
  namespace :admin do
    resources :maps
  end
end
