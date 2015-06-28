Rails.application.routes.draw do
  resources :hardwares
  root 'welcome#index'
end
