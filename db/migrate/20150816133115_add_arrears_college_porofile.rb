class AddArrearsCollegePorofile < ActiveRecord::Migration
  def change
    add_column :college_profiles,:arrears,:integer
    add_column :college_profiles,:history,:integer
    add_column :college_profiles,:total_arrears,:integer
  end
end
