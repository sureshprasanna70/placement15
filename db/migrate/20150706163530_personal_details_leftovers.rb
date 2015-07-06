class PersonalDetailsLeftovers < ActiveRecord::Migration
  def change
    add_column :personal_details,:language_speak,:text
    add_column :personal_details,:language_write,:text
    add_column :personal_details,:language_read,:text
    add_column :personal_details,:social_status,:string
  end
end
