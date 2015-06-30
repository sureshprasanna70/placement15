class SemesterMarksPassYearColType < ActiveRecord::Migration
  def change
    remove_column :semester_marks,:pass_year
    add_column :semester_marks,:pass_year,:string
  end
end
