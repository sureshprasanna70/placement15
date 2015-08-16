class CollegeProfile < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :user_id ,:message=>"already has a profile"
  validates_presence_of :level
  validates_numericality_of :semester,:on=>[:create,:update],:only_integer=>true
  validates_numericality_of :cgpa,:on=>[:create,:update]
  validates_presence_of :degree
  validates_presence_of :semester
  validates_presence_of :college
  validates_presence_of :cgpa
  validates_presence_of :current
  validates_presence_of :history
end
