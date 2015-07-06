class PersonalDetailsLeftovers < ActiveRecord::Migration
  def change
    add_column :personal_profiles,:language_speak,:text
    add_column :personal_profiles,:language_write,:text
    add_column :personal_profiles,:language_read,:text
    add_column :personal_profiles,:social_status,:string
  end
end
