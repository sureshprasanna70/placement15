class DisablityStatusPersonalProfile < ActiveRecord::Migration
  def change
    add_column :personal_profiles,:physically_challenged,:string,:default=>"false"
  end
end
