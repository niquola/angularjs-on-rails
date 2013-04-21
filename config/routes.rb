AngularOnRails::Application.routes.draw do
  match ':controller(/:action).ng', format: 'ng'
  resources :projects do
    resources :issues
  end
  resources :issues
  root :to => 'projects#index'
end
