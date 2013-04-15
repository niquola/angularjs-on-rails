module AngularRoutes
  def self.resources
    @resources ||=[]
  end

  def self.clear
    @resources = []
  end

  def ng_resources(name, *args, &block)
    AngularRoutes.resources<< name
    self.resources(name, *args, &block)
  end

  def ng_resource(name)
    AngularRoutes.resources<< name
    self.resource(name)
  end
end
AngularRoutes.clear

AngularOnRails::Application.routes.draw do


  self.extend(AngularRoutes)

  ng_resources :feeds do
    collection { get :preview }
    resources :entries
  end

  ng_resources :projects

  resources :entries

  root :to => 'feeds#index'
end
