class AcademicDetail < ActiveRecord::Base
  belongs_to :user
  self.table_name="academic_detail"
  validates_presence_of :sslc_institute
  validates_presence_of :sslc_authority
  validates_presence_of :sslc_year
  validates_numericality_of :sslc_year
  validates_presence_of :hsc_mark
  validates_numericality_of :hsc_mark
  validates_presence_of :hsc_institute
  validates_presence_of :hsc_authority
  validates_presence_of :hsc_year
  validates_numericality_of :hsc_year
  validates_presence_of :ug_mark
  validates_numericality_of :ug_mark
  validates_presence_of :ug_institute
  validates_presence_of :ug_authority
  validates_presence_of :ug_year
  validates_numericality_of :ug_year
  validates_presence_of :pg_mark
  validates_numericality_of :pg_mark
  validates_presence_of :pg_institute
  validates_presence_of :pg_authority
  validates_presence_of :pg_year
  validates_numericality_of :pg_year
  validates_presence_of :pg_mark
  validates_numericality_of :pg_mark

end
