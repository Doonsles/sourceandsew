SourceAndSew::Application.routes.draw do
  resources :factories,:only => [:index, :show] do
    resource :favorite, :only => [:create, :destroy]
  end
  resources :users, :only => [:new, :create]
  
  resources :favorites, :only => [:index]
  
  resources :notes, :only => [:index, :update, :create, :destroy]
  
  resource :session
  
  root :to => "static_pages#root"
end
