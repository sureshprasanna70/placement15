class BranchCode < ActiveRecord::Migration
  def change
    add_column :courses,:branch_code,:string,:unique=>true
  end
end
