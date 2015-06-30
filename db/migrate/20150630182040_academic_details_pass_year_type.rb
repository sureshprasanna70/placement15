class AcademicDetailsPassYearType < ActiveRecord::Migration
  def change
    remove_column :academic_details,:pass_year
    add_column :academic_details,:pass_year,:string
  end
end
