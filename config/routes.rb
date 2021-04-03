Rails.application.routes.draw do
  resources :animals do
    resources :details
  end
  get '/random', to: 'details#random'
end
