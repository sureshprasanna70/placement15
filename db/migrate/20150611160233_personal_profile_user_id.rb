class PersonalProfileUserId < ActiveRecord::Migration
  def change
    add_column :personal_profiles,:user_id,:integer
  end
end
