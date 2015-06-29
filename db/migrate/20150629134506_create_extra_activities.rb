class CreateExtraActivities < ActiveRecord::Migration
  def change
    create_table :extra_activities do |t|
      t.text :area_of_interest
      t.text :extra_curricular
      t.text :hobby
      t.text :responsibilty

      t.timestamps null: false
    end
  end
end
