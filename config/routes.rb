AngularOnRails::Application.routes.draw do
  root to: "wellcome#index"
  get ':controller(/:action).ng', format: 'ng'
  get "files/*path" => 'files#show', format: false
  resources :files
end
