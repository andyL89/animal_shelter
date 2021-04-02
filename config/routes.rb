Rails.application.routes.draw do
  resources :animals do
    resources :details
  end
end
