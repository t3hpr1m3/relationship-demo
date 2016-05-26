Rails.application.routes.draw do
  resources :actors, :movies

  root 'static_pages#index'
end
