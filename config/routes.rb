Rails.application.routes.draw do
  resources :actors do
    get '(/name/:name)(/movie/:movie)' => :index, on: :collection, as: :filter
  end
  resources :movies do
    get '(/title/:title)(/actor/:actor)' => :index, on: :collection, as: :filter
  end

  root 'static_pages#index'
end
