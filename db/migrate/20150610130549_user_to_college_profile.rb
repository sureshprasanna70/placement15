class UserToCollegeProfile < ActiveRecord::Migration
  def change
    add_column :college_profiles,:user_id,:integer
  end
end
