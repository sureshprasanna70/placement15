class ChangeDateFieldPersonalProfile < ActiveRecord::Migration
  def change
    remove_column :personal_profiles,:dob
    add_column :personal_profiles,:dob,:string
  end
end
