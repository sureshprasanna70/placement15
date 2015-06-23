class PersonalProfileAddress < ActiveRecord::Migration
  def change
    add_column :personal_profiles,:current_address,:text
    add_column :personal_profiles,:permanent_address,:text
  end
end
