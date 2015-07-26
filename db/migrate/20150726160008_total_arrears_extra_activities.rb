class TotalArrearsExtraActivities < ActiveRecord::Migration
  def change
    add_column :extra_activities,:total_arrears,:integer
  end
end
