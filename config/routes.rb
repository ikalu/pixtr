require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end
  root to: "homes#show"
  resources :groups, only: [:index, :new, :create, :show] do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :dashboard, only: [:show]
  resources :tags, only: [:show]
  resources :galleries do
    resources :images do
      resources :comments, only: [:create]
      resource :like, only: [:create, :destroy]
    end
  end
  #get "/galleries" => "galleries#index"
  #get "/galleries/new" => "galleries#new" #presentation
  #get "/galleries/:id" => "galleries#show", as: :gallery
  #post "/galleries" => "galleries#create" #Persistence or saves to the database
  #get "/galleries/:id/edit" => "galleries#edit"
  #patch "/galleries/:id" => "galleries#update"
  #delete "/galleries/:id" => "galleries#destroy"
end
