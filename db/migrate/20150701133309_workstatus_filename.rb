class WorkstatusFilename < ActiveRecord::Migration
  def change
    add_column :workstatuses,:filename,:text
  end
end
