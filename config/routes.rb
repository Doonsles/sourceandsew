SourceAndSew::Application.routes.draw do
  resources :factories,:only => [:index, :show] do
    resource :favorite, :only => [:create, :destroy]
  end
  resources :users, :only => [:new, :create] do
    resources :notes, :only => [:index, :update, :create, :destroy]
  end
  
  resources :favorites, :only => [:index]
  
  resource :session
  
  root :to => "static_pages#root"
end
