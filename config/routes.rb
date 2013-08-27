AngularOnRails::Application.routes.draw do
  root to: "wellcome#index"
  get 'wellcome' => 'wellcome#index'
  get 'wellcome/details' => 'wellcome#details'
  get ':controller(/:action).ng', format: 'ng'

  resources :files
  get 'files/*id' => 'files#show'
end
