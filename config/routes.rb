Rails.application.routes.draw do
  devise_for :users
  resources :hardwares
  root 'welcome#index'
end
