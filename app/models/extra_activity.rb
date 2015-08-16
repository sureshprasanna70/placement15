class ExtraActivity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :area_of_interest
  validates_presence_of :extra_curricular
  validates_presence_of :hobby
  validates_presence_of :responsibilty
  validates_presence_of :electives
end
