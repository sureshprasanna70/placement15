class ExtraActivityUserId < ActiveRecord::Migration
  def change
    add_column :extra_activities,:user_id,:integer
    remove_column :users,:user_id
  end
end
