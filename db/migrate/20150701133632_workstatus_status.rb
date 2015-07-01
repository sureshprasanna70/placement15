class WorkstatusStatus < ActiveRecord::Migration
  def change
    #remove_column :workstatuses,:workstatus
    add_column :workstatuses,:status,:string
  end
end
