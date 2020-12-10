Rails.application.routes.draw do
  resources :users, :movies

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  post 'logout' => 'session#destroy'
end
