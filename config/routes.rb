Rails.application.routes.draw do
  get '/articles', to: 'articles#index'
  resources :articles do
    resources :comments
  end
end
