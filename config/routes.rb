Rails.application.routes.draw do
  resources :articles
  resources :users
  get '/signup', to: 'users#new'
  root 'articles#home'


get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
get '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
