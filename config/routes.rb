AngularOnRails::Application.routes.draw do
  resources :issues


  match ':controller(/:action).ng', format: 'ng'
  resources :feeds do
    collection { get :preview }
    resources :entries
  end

  resources :projects do
    resources :issues
  end

  resources :entries

  root :to => 'feeds#index'
end
