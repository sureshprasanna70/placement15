class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :college_profiles,:arrears,:current
  end
end
