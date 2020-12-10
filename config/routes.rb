Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy] do
    resources :reviews, except: [:index, :show]
  end

  resources :movies do
    resources :reviews, except: [:index, :show]
  end

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  post 'logout' => 'session#destroy'
end
