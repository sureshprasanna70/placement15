class CreateWorkstatuses < ActiveRecord::Migration
  def change
    create_table :workstatuses do |t|
      t.string :numrange
      t.boolean :workstatus

      t.timestamps null: false
    end
  end
end
