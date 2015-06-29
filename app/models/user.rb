class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :pic,AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  validates_uniqueness_of :registerno
  validates_numericality_of :phone
  validates_numericality_of :phone
  validates_uniqueness_of :phone
 has_one :college_profile
  has_one :personal_profile
  has_many :academic_detail
  has_many :semester_mark
  has_one :extra_activity
end
