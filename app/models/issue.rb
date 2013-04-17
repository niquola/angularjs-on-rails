class Issue < ActiveRecord::Base
  attr_accessible :description, :title, :tracker
end
