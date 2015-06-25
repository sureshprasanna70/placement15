class SemesterMarkUserId < ActiveRecord::Migration
  def change
    add_column :semester_marks,:user_id,:integer
  end
end
