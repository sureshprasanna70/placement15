class AcademicDetailsUser < ActiveRecord::Migration
  def change
    add_column :academic_details,:user_id,:integer
  end
end
