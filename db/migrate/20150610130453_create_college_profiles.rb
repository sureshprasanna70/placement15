class CreateCollegeProfiles < ActiveRecord::Migration
  def change
    create_table :college_profiles do |t|
      t.string :level
      t.string :degree
      t.string :branch
      t.string :college
      t.integer :semester
      t.float :cgpa

      t.timestamps null: false
    end
  end
end
