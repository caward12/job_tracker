Rails.application.routes.draw do
root to: 'jobs#dashboard'
  resources :companies do
    resources :contacts
    resources :jobs do
      resources :comments
    end
  end
  resources :categories
  resources :tags
  get 'jobs' => 'jobs#sort'
  get 'dashboard' => 'jobs#dashboard'
  get 'search' => 'jobs#search'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'
end
