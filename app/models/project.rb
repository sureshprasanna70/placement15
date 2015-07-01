class Project < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :desc
  validates_presence_of :technology
end
