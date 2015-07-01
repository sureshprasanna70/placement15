class SemesterMark < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :semester
  validates_numericality_of :semester
  validates_presence_of :gpa
  validates_numericality_of :gpa
  validates_presence_of :pass_year
  validates_numericality_of :pass_year
end
