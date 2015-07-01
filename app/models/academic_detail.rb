class AcademicDetail < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :course
  validates_presence_of :institution
  validates_presence_of :examination_authority
  validates_presence_of :pass_year
  validates_numericality_of :pass_year
  validates_presence_of :percentage
  validates_numericality_of :percentage
end
