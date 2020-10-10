Rails.application.routes.draw do
  devise_for :users
  resources :podcasts do
    resources :reviews
  end

  root to: 'podcasts#index'
end
