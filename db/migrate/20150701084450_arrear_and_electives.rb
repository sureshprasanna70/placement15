class ArrearAndElectives < ActiveRecord::Migration
  def change
    add_column :extra_activities,:arrears,:boolean
    add_column :extra_activities,:current,:integer
    add_column :extra_activities,:history,:integer
    add_column :extra_activities,:electives,:text
  end
end
