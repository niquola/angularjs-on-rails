class Issue < ActiveRecord::Base
  belongs_to :project
  validate :status, presence: true
end
