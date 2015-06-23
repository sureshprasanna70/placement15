class CreateAcademicDetails < ActiveRecord::Migration
  def change
    create_table :academic_details do |t|
      t.string :course
      t.text :institution
      t.string :examination_authority
      t.date :pass_year
      t.float :percentage

      t.timestamps null: false
    end
  end
end
