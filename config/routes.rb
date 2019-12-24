Rails.application.routes.draw do
  root to: 'maps#root'
  get 'maps/select' => 'maps#show'
  post 'reviews/count'
  resources :maps do
    resources :sites do
      resources :comments do
      end
    end
  end
end
