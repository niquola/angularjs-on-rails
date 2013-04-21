class Project < ActiveRecord::Base
  has_many :issues
  validates :name, presence: true
  validates :description, presence: true
end
