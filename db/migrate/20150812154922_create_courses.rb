class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :degree
      t.text :branch

      t.timestamps null: false
    end
  end
end
