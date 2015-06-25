class CreateSemesterMarks < ActiveRecord::Migration
  def change
    create_table :semester_marks do |t|
      t.integer :semester
      t.float :gpa
      t.date :pass_year

      t.timestamps null: false
    end
  end
end
