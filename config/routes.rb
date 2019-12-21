Rails.application.routes.draw do
  root to: 'maps#index'
  get 'reviews/count'
  resources :maps do
    resources :sites do
      resources :comments do
      end
    end
  end
end
