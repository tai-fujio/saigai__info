Rails.application.routes.draw do
  root to: 'maps#root'
  get 'maps/select' => 'maps#show'
  get 'reviews/count'
  get 'search' => 'finds#search'
  get 'finds/show'
  post 'reviews/count'
  post 'sites/delete'
  post 'comments/delete'
  resources :maps do
    resources :sites do
      resources :comments do
      end
    end
  end
end
