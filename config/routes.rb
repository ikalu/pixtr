Rails.application.routes.draw do
  root to: "homes#show"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :galleries do
    resources :images do
      resources :comments, only: [:create]
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
