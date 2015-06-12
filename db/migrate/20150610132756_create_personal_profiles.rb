class CreatePersonalProfiles < ActiveRecord::Migration
  def change
    create_table :personal_profiles do |t|
      t.string :gender
      t.date :dob
      t.integer :age
      t.integer :height
      t.integer :weight
      t.text :guardian_name
      t.text :guardian_occupation
      t.string :nationality
      t.string :mother_tongue

      t.timestamps null: false
    end
  end
end
