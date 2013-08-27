AngularOnRails::Application.routes.draw do
  get ':controller(/:action).ng', format: 'ng'
  get "files/*path" => 'files#show', format: false
  resources :files
  root :to => 'files#index'
end
