AngularOnRails::Application.routes.draw do
  get ':controller(/:action).ng', format: 'ng'
  resources :projects do
    resources :issues
  end
  resources :issues
  resources 'slides'
  root :to => 'projects#index'
end
