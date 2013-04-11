module AngularRoutes
  def self.resources
    @resources ||=[]
  end

  def self.clear
    @resources = []
  end

  def ng_resources(name)
    AngularRoutes.resources<< name
    self.resources(name)
  end

  def ng_resource(name)
    AngularRoutes.resources<< name
    self.resource(name)
  end
end
AngularRoutes.clear

AngularOnRails::Application.routes.draw do
  self.extend(AngularRoutes)

  ng_resources :feeds
  root :to => 'feeds#index'
end
