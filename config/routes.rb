Rails.application.routes.draw do
  resources :serveys

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
  get "dashboard/residential-verifications" => "assignments#residential_verifications", :as => :residential_verifications
  get "dashboard/office-verifications" => "assignments#office_verifications", :as => :office_verifications

  get "cusomers/completed" => "customers#completed", :as => :completed
  get "cusomers/pending" => "customers#pending", :as => :pending
  get "cusomers/in_progress" => "customers#in_progress", :as => :in_progress
  get "dashboard/index"
#  root 'customers#index'
  root 'dashboards#index'
  match '/signup',  to: 'users#new',  via: 'get'
  #match '/completed', to: 'appointments#completed', via: 'get'
  match '/login' , to: "sessions#new" , via: "get"
  match '/logout'  ,to: "sessions#destroy" , via: "delete"
end
