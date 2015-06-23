class PersonalProfilesCommunicate < ActiveRecord::Migration
  def change
    add_column :personal_profiles,:communicate,:string
  end
end
