class PersonalProfile < ActiveRecord::Base
  validates_presence_of :gender
  validates_presence_of :dob
  validates :dob,:date=>true
  validates_presence_of :age
  validates_numericality_of :age,:on=>[:create,:update]
  validates_presence_of :height
  validates_numericality_of :height,:on=>[:create,:update]
  validates_presence_of :weight
  validates_numericality_of :weight,:on=>[:create,:update]
  validates_presence_of :guardian_name
  validates_presence_of :guardian_occupation
  validates_presence_of :nationality
  validates_presence_of :mother_tongue
  validates_presence_of :language_speak
  validates_presence_of :language_write
  validates_presence_of :language_read
  validates_presence_of :social_status
end
