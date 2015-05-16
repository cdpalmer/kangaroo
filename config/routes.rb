Kangaroo::Application.routes.draw do
  resources :movies
  resources :theatres
  resources :showtimes
  resources :queries

  root 'queries#index'
end
