Rails.application.routes.draw do
  resources :assignments
  get 'dashboards/index'
  resources :tabs
  resources :users
  resources :customers do
   collection do
    post :import
   end
   member do
    get :accept
    post :accpet
    get :reassign
    post :reassign
    get :customer_mapdetail
   end
  end

  resources :sessions , only: [:new,:create,:destroy]
  root 'customers#index' 
  match '/signup',  to: 'users#new',  via: 'get'
  #match '/completed', to: 'appointments#completed', via: 'get'
  match '/login' , to: "sessions#new" , via: "get"
  match '/logout'  ,to: "sessions#destroy" , via: "delete"
end
