Rails.application.routes.draw do
  root to: 'maps#index'
  get 'votes/count'
  resources :maps do
    resources :sites do
      resources :reviews do
      end
    end
  end
end
