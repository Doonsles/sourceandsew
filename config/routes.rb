SourceAndSew::Application.routes.draw do
  resources :factories,:only => [:index, :show]
  resources :users, :only => [:new, :create] do
    resources :favorites, :only => [:index, :new, :create, :destroy]
    resources :notes, :only => [:index, :update, :create, :destroy]
  end
  
  resource :session
end
