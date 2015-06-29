class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :desc
      t.text :technology

      t.timestamps null: false
    end
  end
end
